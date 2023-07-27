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


strong 'Shell:'
sudo echo $(which zsh) >> /etc/shells && echo $(which $shell)
chsh -s $(which zsh)

strong 'Zinit:'
checkdir ~/.zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

strong 'Neovim:'
curl -fLo ~/.config/nvim/autoload/jetpack.vim --create-dirs \
  https://raw.githubusercontent.com/tani/vim-jetpack/master/plugin/jetpack.vim
nvim -c JetpackSync -c qall

strong 'asdf:'
cat $DOTPATH/etc/asdf-plugin-list | while read plg; do
  asdf plugin-add $plg
  asdf install $plg latest
  asdf reshim $plg
done

strong 'Rye & Python tools'
curl -sSf https://rye-up.com/get | bash
# curl -sSL https://install.python-poetry.org | python3 -
cat $DOTPATH/etc/python-tools | while read tool; do
    ~/.rye/shims/rye install $tool
done

strong 'Docker:'
checkdir $ZSH_COMPLETIONS_PATH
for comp in $DOCKER_COMPLETIONS_PATH/*.zsh-completion; do
  file=${comp##*/}
  cp $comp $ZSH_COMPLETIONS_PATH/_${file%.*}
done

strong 'Rust'
curl https://sh.rustup.rs -sSf | sh
~/.cargo/bin/rustup component add rls-preview rust-analysis rust-src

strong 'Zellij'
~/.cargo/bin/cargo install --locked zellij

echo 'Initialization finished successfully!!'
