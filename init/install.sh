#!/bin/sh

# _utils ==============================================
set -e

DOT_TARBALL="https://github.com/shikibu9419/dotfiles/tarball/master"

has() {
  type "$1" > /dev/null 2>&1
}

notice() {
  echo "=================================================="
  echo $1
  echo "=================================================="
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

# =====================================================


install() {
  notice "Installing command-line-tools..."
  xcode-select --install

  if [ -d $DOTPATH ]; then
    error_msg "**warning** $DOTPATH will be deleted!!\nInstallation failed."
  fi

  mkdir $DOTPATH

  if has "git"; then
    git clone https://github.com/shikibu9419/dotfiles $DOTPATH
  elif has "curl"; then
    curl -fsSLo $HOME/dotfiles.tar.gz $DOT_TARBALL
    tar -zxvf $HOME/dotfiles.tar.gz --strip-components=1 -C $DOTPATH
    rm -f $HOME/dotfiles.tar.gz
  else
    error_msg "Command 'git' and 'curl' not found.\nPlease install one of them to install dotfiles."
  fi

  success_msg "Dotfiles were installed!"
}

usage() {
  name=`basename $0`
  cat <<EOF
Usage:
  install.sh COMMAND [dotpath]
COMMAND:
  init      Initialize your OS X and deploy dotfiles.
  deploy    Deploy dotfiles.
EOF
  exit 1
}


if [[ $# -gt 2 ]]; then
  usage
fi

# set DOTPATH
export DOTPATH="$HOME/dotfiles"
if [[ $# -eq 2 ]]; then
  if [[ -d $2 ]]; then
    export DOTPATH="$2/dotfiles"
  else
    echo "Path $2 not found."
    exit 1
  fi
fi

install

# deploy or initialize
while getopts :ad:h opt; do
  case $opt in
    d)  bash $DOTPATH/init/deploy.sh
        ;;
    i)  bash $DOTPATH/init/initialize.sh
        bash $DOTPATH/init/deploy.sh
        ;;
    *)  usage
        ;;
  esac
done

# set shell
read -p "Change shell? (enter zsh or fish): " shell
if [[ $shell = 'zsh' || $shell = 'fish' ]]; then
  chsh -s $(which $shell)
fi

result_msg "Install finished successfully!"
