#!/bin/sh

set -eu
DOCKER_COMPLETIONS_PATH=/Applications/Docker.app/Contents/Resources/etc
ZSH_COMPLETIONS_PATH=~/.zsh/completions

has() {
  return $(type "$1" > /dev/null 2>&1)
}

notice() {
  echo ==================================================
  echo " $1"
  echo ==================================================
}

strong() {
  msg="\e[37;1m$1\e[m\n"
  if has 'printf'; then
    printf $msg
  else
    echo -e $msg
  fi
}

error() {
  echo $1 1>&2
  echo 'Initialization failed.' 1>&2
  exit 1
}

checkdir() {
  [ -d $1 ] || mkdir -p $1
}

cd $DOTPATH

notice 'Install formulas.'
brew tap homebrew/bundle
HOMEBREW_CASK_OPTS="--appdir=/Applications" brew bundle
brew cleanup
strong 'Installation of formulas finished!'
echo

notice 'Formula settings...'
strong 'Shell:'
for shell in {z,fi,xon}sh; do
  if has 'tee'; then
    echo $(which $shell)  | sudo tee -a /etc/shells
  else
    sudo echo $(which $shell) >> /etc/shells && echo $(which $shell)
  fi
done
chsh -s $(which zsh)

strong 'Neovim:'
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
nvim -c PlugInstall -c qall

strong 'VS Code:'
cat $DOTPATH/etc/vscode-extensions | while read pkg; do
  code --install-extension $pkg
done

strong 'Docker:'
checkdir $ZSH_COMPLETIONS_PATH
for comp in $DOCKER_COMPLETIONS_PATH/*.zsh-completion; do
  file=${comp##*/}
  cp $comp $ZSH_COMPLETIONS_PATH/_${file%.*}
done

strong 'Others:'
curl https://sh.rustup.rs -sSf | sh

echo 'Initialization finished successfully!!'
