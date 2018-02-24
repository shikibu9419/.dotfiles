#!/bin/sh
set -e

VIM_DEIN_DIRECTORY="$DOTPATH/.vim/dein/repos/github.com/Shougo/dein.vim"
TMUX_TPM_DIRECTORY="$HOME/.tmux/plugins/tpm"

has() {
  type "$1" > /dev/null 2>&1
}

if has "brew"; then
  echo "=================================================="
  echo "Updating Homebrew..."
  echo "=================================================="

  brew update && brew upgrade
else
  echo "=================================================="
  echo "Installing Homebrew..."
  echo "=================================================="

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if !has "brew"; then
  echo "\nInstalling Homebrew failed."
  exit 1
fi

echo "=================================================="
echo "Start brew install..."
echo "=================================================="

brew tap homebrew/bundle
brew bundle
brew cleanup

echo "=================================================="
echo "Brew finished!"
echo "=================================================="

# zsh config
if [ $SHELL != $(which zsh) ]; then
  chsh -s $(which zsh)
fi

# vim config
if [[ ! -d $VIM_DEIN_DIRECTORY ]]; then
  mkdir -p $VIM_DEIN_DIRECTORY
  git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
fi

# tmux config
if [[ ! -d $TMUX_TPM_DIRECTORY ]]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_DIRECTORY
fi

# docker config

# python config
pip install --upgrade setuptools
pip install --upgrade pip
pip3 install neovim

echo "\nInitialization is completed!!"
