# on accepting line
_show_ls_gs() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return 0
  fi

  echo
  echo -e "\e[0;33m--- ls ---\e[0m"
  ls
  echo

  if [ "$(git rev-parse --is-inside-work-tree 2> /dev/null)" = 'true' ]; then
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
  zle clear-screen
}

_git_list_checkout() {
  local branches=$(git branch --all | grep -v HEAD)
  local branch=$(echo $branches | fzf-tmux -d)
  git checkout $(echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  zle accept-line
}

_git_list_log() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --select-1 \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

_git_list_worktree() {
  git rev-parse &>/dev/null
  if [ $? -ne 0 ]; then
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

  if [[ -z $selected ]]; then
    return
  elif [[ -z $TMUX ]]; then
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

  tmux list-sessions | grep $session > /dev/null
  if [[ $? = 0 ]]; then
    tmux switch-client -t $session
  else
    if [[ $current_session =~ ^[0-9]+$ ]]; then
      BUFFER="cd $dir"
      zle accept-line
      tmux rename-session $session
    else
      tmux new-session -d -c $dir -s $session
      tmux switch-client -t $session
    fi
  fi
}
