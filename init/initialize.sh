#!/bin/sh
set -e

VIM_DEIN_DIRECTORY="$DOTPATH/.vim/dein/repos/github.com/Shougo/dein.vim"
TMUX_TPM_DIRECTORY="$HOME/.tmux/plugins/tpm"
DOCKER_COMPLETION_PATH="/Applications/Docker.app/Contents/Resources/etc"

has() {
  type "$1" > /dev/null 2>&1
}

notice() {
  echo "=================================================="
  echo $1
  echo "=================================================="
}

result_msg() {
  if has "printf"; then
    printf "\n\e[37;1m$1\n"
  else
    echo "\n**$1**\n"
  fi
}


notice "Installing Xcode..."
xcode-select --install

if has "brew"; then
  notice "Updating Homebrew..."
  brew update && brew upgrade
else
  notice "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if !has "brew"; then
  result_msg "Installing Homebrew failed."
  exit 1
fi

notice "Start brew install."
brew tap homebrew/bundle
brew bundle
brew cleanup

result_msg "Brew install finished!"
notice "Others..."

# Zsh config
if [ $SHELL != $(which zsh) ]; then
  chsh -s $(which zsh)
fi

# Vim config
if [[ ! -d $VIM_DEIN_DIRECTORY ]]; then
  mkdir -p $VIM_DEIN_DIRECTORY
  git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
fi

# Tmux config
if [[ ! -d $TMUX_TPM_DIRECTORY ]]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_DIRECTORY
fi

# Docker config
mkdir $DOTPATH/.zsh/completions
cp $DOCKER_COMPLETION_PATH/docker.zsh-completion $DOTPATH/.zsh/completions/_docker
cp $DOCKER_COMPLETION_PATH/docker-compose.zsh-completion $DOTPATH/.zsh/completions/_docker-compose
cp $DOCKER_COMPLETION_PATH/docker-machine.zsh-completion $DOTPATH/.zsh/completions/_docker-machine

# Python config
pip install --upgrade setuptools
pip install --upgrade pip
pip3 install neovim
pip install numpy
pip install scipy
pip install matplotlib
pip install mutagen

# Ricty setup
cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
fc-cache -vf

result_msg "Initialization is completed!!"
