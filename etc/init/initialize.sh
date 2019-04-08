#!/bin/sh

set -eu
DOCKER_COMPLETIONS_PATH=/Applications/Docker.app/Contents/Resources/etc
ZSH_COMPLETIONS_PATH=~/.zsh/completions
RBENV_ROOT=~/.rbenv

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
brew bundle
brew cleanup
strong 'Installation of formulas finished!\n'

notice 'Formula settings...'
strong 'Shell:'
for shell in (z|fi|xon)sh; do
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

strong 'VS Code:'
code --install-extension Shan.code-settings-sync

strong 'Docker:'
checkdir $ZSH_COMPLETIONS_PATH
for comp in $DOCKER_COMPLETIONS_PATH/*.zsh-completion; do
  file=${comp##*/}
  cp $comp $ZSH_COMPLETIONS_PATH/_${file%.*}
done

strong 'gem:'
checkdir $RBENV_ROOT
ln -sifF $DOTPATH/etc/init/rbenv-default-gems $RBENV_ROOT/default-gems

strong 'pip:'
pip3 install --upgrade setuptools
pip3 install $(cat $DOTPATH/etc/init/pip-requirements)


echo 'Initialization finished successfully!!'
string 'Please run this commands to initialize completely:'
cat <<EOF
zplug install
curl https://sh.rustup.rs -sSf | sh
rustup component add rls-preview rust-analysis rust-src
EOF
