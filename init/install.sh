#!/bin/sh

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
    error_msg "**warning** $DOTPATH will be deleted!!\nInstallation failed."
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
    error_msg "Command 'git' and 'curl' were not found.\nPlease install one of them to install dotfiles."
  fi

  success_msg "Dotfiles were installed!"
}


if [ $# -ne 1 || $1 != "deploy" && $1 != "init" ]; then
  usage
fi

export DOTPATH="$HOME/dotfiles"

install
[[ $1 = 'init' ]] && sh $DOTPATH/init/initialize.sh
sh $DOTPATH/init/deploy.sh

# set shell
read -p "Which shell do you use? (zsh or fish): " shell
if [[ $shell = 'zsh' || $shell = 'fish' ]]; then
  chsh -s $(which $shell)
fi

# Notification
success_msg "Install finished successfully!"

cat <<EOF
Please run this commands to complete initialize truly.
> rustup component add rls-preview rust-analysis rust-src
> defaults write com.apple.CrashReporter UseUNC 1
> defaults write com.apple.dock springboard-columns -int 10
> killall Dock

And please rewrite ~/.globalrc as following diff.
  default:\
- :tc=native:
+ :tc=native:tc=pygments:
EOF
