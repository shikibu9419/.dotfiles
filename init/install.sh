#!/bin/sh

install() {
  notice "Installing Xcode..."
  xcode-select --install

  if [ -d $DOTPATH ]; then
    echo "**warning** $DOTPATH will be deleted!!"
    echo "Installation failed."
    exit 1
  fi

  mkdir $DOTPATH

  if has "git"; then
    git clone https://github.com/shikibu9419/dotfiles $DOTPATH
  elif has "curl"; then
    curl -fsSLo $HOME/dotfiles.tar.gz $DOT_TARBALL
    tar -zxvf $HOME/dotfiles.tar.gz --strip-components=1 -C $DOTPATH
    rm -f $HOME/dotfiles.tar.gz
  else
    echo "\nInstalling shikibu9419's dotfiles failed..."
    exit 1
  fi

  notice "Dotfiles were installed!"
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

if [[ $# -le 1 ]]; then
  install

  if [[ $# -eq 1 ]]; then
    cd $DOTPATH

    case $1 in
      deploy)
        bash init/deploy.sh
        ;;
      init)
        bash init/initialize.sh
        bash init/deploy.sh
        ;;
      *)
        usage
        ;;
    esac
  fi
else
  usage
fi
