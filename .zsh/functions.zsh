# use incremental search
_select_history() {
  local tac="tac"
  if ! which tac > /dev/null; then
    tac="tail -r"
  fi

  BUFFER=$(fc -l -n 1 | eval "$tac" | fzf --reverse --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

_ghq_list_repositories() {
  local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
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
  fzf --ansi --no-sort --reverse --tiebreak=index \
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

  local work_dir=`git worktree list | fzf | awk '{print $1}'`

  if [ $work_dir = "" ]; then
    return
  fi

  cd $work_dir
}

# git
_remote_origin() {
  git remote add origin $(pbpaste)
}

_push_origin() {
  git push origin $(git branch | grep "*\ " | sed "s/.* //")
}
