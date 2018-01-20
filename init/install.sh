#!/bin/sh
set -e

export DOTPATH="$HOME/dotfiles"

DOT_TARBALL="https://github.com/shikibu9419/dotfiles/tarball/master"

has() {
	type "$1" > /dev/null 2>&1
}

install() {
    if [ -d $DOTPATH ]; then
        echo "**warning** $DOTPATH will be deleted!!"
        echo "Installation failed."
        exit 1
    fi

    mkdir $DOTPATH

    if has "git"; then
        git clone https://github.com/shikibu9419/dotfiles $DOTPATH
    else
        curl -fsSLo $HOME/dotfiles.tar.gz $DOT_TARBALL
        tar -zxvf $HOME/dotfiles.tar.gz --strip-components=1 -C $DOTPATH
        rm -f $HOME/dotfiles.tar.gz
    fi

    echo "Dotfiles were installed!"
}

usage() {
    name=`basename $0`
    cat <<EOF
Usage:
  install.sh [command]
Commands:
  init      Initialize your OS X and deploy dotfiles.
  deploy    Deploy dotfiles.
EOF
    exit 1
}

if [ $# -le 1 ]; then
  install
  if [ $# -eq 1]; then
    case $0 in
      deploy)
        bash $DOTPATH/init/deploy.sh
        ;;
      init)
        bash $DOTPATH/init/initialize.sh
        bash $DOTPATH/init/deploy.sh
        ;;
      *)
        usage
        ;;
    esac
  fi
else
  usage
fi
