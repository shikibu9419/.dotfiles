#!/bin/sh

set -e
DOT_TARBALL="https://github.com/shikibu9419/.dotfiles/tarball/master"

has() {
  type "$1" > /dev/null 2>&1
}

install() {
  dir=$1
  if [ -d $dir ]; then
    echo "**warning** $dir will be deleted!!\nInstallation failed."
  fi

  echo "Installing command-line-tools..."
  xcode-select --install
  sudo xcode-select -s /Library/Developer/CommandLineTools

  if has "git"; then
    git clone https://github.com/shikibu9419/.dotfiles
  elif has "curl"; then
    curl -fsSLo $dir.tar.gz $DOT_TARBALL
    tar -zxvf $dir.tar.gz --strip-components=1 -C $dir
    rm -f $dir.tar.gz
  else
    echo "Neither 'git' nor 'curl' were found.\nPlease install one of them to install dotfiles."
  fi

  echo "dotfiles were installed!\n"
}

install $1
