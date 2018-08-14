# select history
_select_history() {
  local tac="tac"
  if ! which tac > /dev/null; then
    tac="tail -r"
  fi

  BUFFER=$(fc -l -n 1 | eval "$tac" | fzf --reverse --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}

# ghq list repositories
_ghq_list_repositories() {
  local selected_dir=$(ghq list -p | fzf --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

# git
_remote_origin() {
  git remote add origin $(pbpaste)
}

_push_origin() {
  git push origin $(git branch | grep "*\ " | sed "s/.* //")
}

_list_checkout() {
  local branches=$(git branch --all | grep -v HEAD)
  local branch=$(echo $branches | fzf-tmux -d)
  git checkout $(echo $branch | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  zle accept-line
}
