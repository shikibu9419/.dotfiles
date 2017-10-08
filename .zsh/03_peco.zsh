# Select histories
function peco_select_history() {
  local tac
  if which tac > /dev/null; then
    tac="tac"
  else
    tac="tail -r"
  fi

  buffer=$(fc -l -n 1 | eval $tac | peco --query "$lbuffer")
  cursor=$#buffer
  zle clear-screen
}
zle -N peco_select_history
bindkey '^r' peco_select_history

# Search ~/src/repositories
function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src
