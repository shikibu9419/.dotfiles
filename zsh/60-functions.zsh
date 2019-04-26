_check_available_git() {
  git rev-parse > /dev/null 2>&1
}

_show_ls_gs() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return
  fi

  echo
  echo -e '\e[0;33m--- ls ---\e[0m'
  ls
  echo

  if _check_available_git; then
    echo -e '\e[0;33m--- git status ---\e[0m'
    git status -sb
    echo
  fi
  echo

  zle reset-prompt
}

select_history() {
  local BUFFER=$(fc -l -n 1 | fzf --reverse --tac --query=$LBUFFER)
  CURSOR=$#BUFFER
}

vscode_open_project() {
  local selected dir repo session current_session
  selected=$(ghq list | fzf)
  project=$(ghq root)/$selected

  [[ -z $selected ]] && return

  code $project
}

git_list_branch() {
  if ! _check_available_git; then
    echo 'fatal: not a git repository.'
    return 1
  fi

  branch=$(git branch --all | grep -v HEAD | fzf-tmux --ansi -d)
  [ -n $branch ] && git checkout $(echo $branch | sed 's/.* //' | sed 's#remotes/[^/]*/##')
  zle reset-prompt
}

ghq_jump_repository() {
  local selected dir repo session current_session
  selected=$(ghq list | fzf --query=$LBUFFER)
  dir=$(ghq root)/$selected

  if [ -z $selected ]; then
    return
  elif [ -z $TMUX ]; then
    BUFFER="cd $dir"
    zle accept-line
    return
  fi

  repo=${dir##*/}
  if [[ ! $selected =~ ^'github.com'.+$ ]]; then
    parent=${dir%/*}
    repo=${parent##*/}/$repo
  fi

  session=${repo//./-}
  current_session=$(tmux list-sessions | grep attached | cut -d":" -f1)

  if [[ $current_session = $session ]]; then
    BUFFER="cd $dir"
    zle accept-line
    return
  fi

  if [[ -n $(tmux list-sessions | grep $session) ]]; then
    tmux switch-client -t $session
    return
  fi

  if [[ $current_session =~ ^[0-9]+$ ]]; then
    BUFFER="cd $dir"
    zle accept-line
    tmux rename-session $session
  else
    tmux new-session -d -c $dir -s $session
    tmux switch-client -t $session
  fi
}
