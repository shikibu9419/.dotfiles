#!/bin/sh
set -e

export DOTPATH="$HOME/dotfiles"
DOT_TARBALL="https://github.com/shikibu9419/dotfiles/tarball/master"

has() {
  type "$1" > /dev/null 2>&1
}

notice() {
  echo "=================================================="
  echo $1
  echo "=================================================="
}

strong_msg() {
  if has "printf"; then
    printf "\e[37;1m$1\e[m\n"
  else
    echo -e "\e[37;1m$1\e[m"
  fi
}

error() {
  strong_msg $1
  exit 1
}

usage() {
  name=`basename $0`
  cat <<EOF
Usage:
  install.sh COMMAND
COMMAND:
  init      Initialize your OS X and deploy dotfiles.
  deploy    Deploy dotfiles.
EOF
  exit 1
}

install() {
  notice "Installing command-line-tools..."
  xcode-select --install
  sudo xcode-select -s /Library/Developer/CommandLineTools

  if [ -d $DOTPATH ]; then
    error "**warning** $DOTPATH will be deleted!!\nInstallation failed."
  fi

  mkdir $DOTPATH

  if has "git"; then
    git clone https://github.com/shikibu9419/dotfiles $DOTPATH
  elif has "curl"; then
    ## $DOTPATH.tar.gz => ~/dotfiles.tar.gz
    curl -fsSLo $DOTPAH.tar.gz $DOT_TARBALL
    tar -zxvf $DOTPAH.tar.gz --strip-components=1 -C $DOTPATH
    rm -f $DOTPAH.tar.gz
  else
    error "Command 'git' and 'curl' were not found.\nPlease install one of them to install dotfiles."
  fi

  strong_msg "Dotfiles were installed!\n"
}


if [ $# -ne 1 || $1 != "deploy" && $1 != "init" ]; then
  usage
fi

# Install
install
[[ $1 = 'init' ]] && sh $DOTPATH/init/initialize.sh
sh $DOTPATH/init/deploy.sh
sh $DOTPATH/init/mac_defaults.sh

# Set shell
read -p "Which shell do you use? (zsh or fish): " shell
[[ $shell = 'zsh' || $shell = 'fish' ]] && chsh -s $(which $shell)

# Notification
strong_msg "Install finished successfully!"
cat <<EOF
Please run this commands to complete initialize truly.
> rustup component add rls-preview rust-analysis rust-src

And please rewrite ~/.globalrc as following diff.
37   default:\
38 - :tc=native:
   + :tc=native:tc=pygments:
EOF
