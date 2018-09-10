#!/bin/sh

# _utils ===============================================================
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

# ======================================================================


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


if [[ $# -gt 2 || $1 != "deploy" && $1 != "init" ]]; then
  usage
fi

# export DOTPATH
export DOTPATH="$HOME/dotfiles"
if [[ $# -eq 2 ]]; then
  mkdir -p $2
  export DOTPATH=$2
fi

install

# deploy or initialize
case $1 in
  deploy)
    bash $DOTPATH/init/deploy.sh
    ;;
  init)
    bash $DOTPATH/init/initialize.sh
    bash $DOTPATH/init/deploy.sh
    ;;
  *)  usage
    ;;
esac

# set shell
read -p "Which shell do you use? (zsh or fish): " shell
if [[ $shell = 'zsh' || $shell = 'fish' ]]; then
  chsh -s $(which $shell)
fi

success_msg "Install finished successfully!"
