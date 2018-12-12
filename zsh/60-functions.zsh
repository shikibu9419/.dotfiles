_show_ls_gs() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return
  fi

  echo
  echo -e '\e[0;33m--- ls ---\e[0m'
  ls
  echo

  if $(git rev-parse > /dev/null 2>&1); then
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
