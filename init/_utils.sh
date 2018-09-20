#!/bin/sh

set -e

DOT_TARBALL="https://github.com/shikibu9419/dotfiles/tarball/master"
VIM_DEIN_DIRECTORY="$DOTPATH/.vim/dein/repos/github.com/Shougo/dein.vim"
TMUX_TPM_DIRECTORY="$HOME/.tmux/plugins/tpm"
DOCKER_COMPLETION_PATH="/Applications/Docker.app/Contents/Resources/etc"

has() {
  type "$1" > /dev/null 2>&1
}

notice() {
  echo "============================================================"
  echo $1
  echo "============================================================"
}

success_msg() {
  if has "printf"; then
    printf "\n\e[37;1m$1\n"
  else
    echo "\n**$1**\n"
  fi
}

error_msg() {
  echo $1
  exit 1
}

break_point() {
  read -p "Next is $1. Continue? (y or n): " order
  if [[ $order = 'n' ]]; then
    exit 0
  fi
}
