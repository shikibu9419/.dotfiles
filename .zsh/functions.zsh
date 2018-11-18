# on accepting line
_show_ls_gs() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return
  fi

  echo
  echo -e "\e[0;33m--- ls ---\e[0m"
  ls
  echo

  if _git_available; then
    echo -e "\e[0;33m--- git status ---\e[0m"
    git status -sb
    echo
  fi
  echo

  zle reset-prompt
}


# using with fzf
_select_history() {
  local BUFFER=$(fc -l -n 1 | fzf --reverse --tac --query=$LBUFFER)
  CURSOR=$#BUFFER
}


_git_list_checkout() {
  echo
  if ! _git_available; then
    echo fatal: Not a git repository.
    _show_ls_gs
    return
  fi

  local branches=$(git branch --all | grep -v HEAD)
  local branch=$(echo $branches | fzf-tmux -d)
  git checkout $(echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  zle reset-prompt
}


_git_list_log() {
  if ! _git_available; then
    echo fatal: Not a git repository.
    return
  fi

  git log --graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --select-1 \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}


_git_list_worktree() {
  if ! _git_available; then
    echo fatal: Not a git repository.
    return
  fi

  local work_dir=`git worktree list | fzf --exit-0 --select-1 | awk '{print $1}'`
  if [ -z $work_dir ]; then
    cd $work_dir
  fi
}


_ghq_list_repositories() {
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
  if [[ ! $selected =~ ^github\.com.+$ ]]; then
    parent=${dir%/*}
    repo=${parent##*/}/$repo
  fi

  session=${repo//./-}
  current_session=$(tmux list-sessions | grep 'attached' | cut -d":" -f1)

  if [[ -n $current_session = $session ]]; then
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


# utils
_git_available() {
  git rev-parse > /dev/null 2>&1
}
