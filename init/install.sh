#!/bin/sh

set -e
DOT_TARBALL='https://github.com/shikibu9419/.dotfiles/tarball/master'

error() {
  echo $1 1>&2
  echo 'Installation failed.' 1>&2
  exit 1
}

has() {
  type "$1" > /dev/null 2>&1
}

dir=~/.dotfiles
[ -n $1 ] && dir=$1
[ -d $dir ] && error "**warning** $dir will be deleted!!"

## Homebrew setting
if has 'brew'; then
  brew update && brew upgrade
else
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

has 'brew' || error "Can't install Homebrew."

## Install dotfiles
if has 'git'; then
  git clone https://github.com/shikibu9419/.dotfiles $dir
elif has 'curl'; then
  curl -fsSL $DOT_TARBALL -o $dir.tar.gz
  tar -zxvf $dir.tar.gz --strip-components=1 -C $dir
  rm -f $dir.tar.gz
else
  error "Neither 'git' nor 'curl' were found.\nPlease install one of them to install dotfiles."
fi

echo "Dotfiles were installed on $dir!"
echo
