#!/bin/sh
set -e

VIM_DEIN_DIRECTORY="$DOTPATH/.vim/dein/repos/github.com/Shougo/dein.vim"
TMUX_TPM_DIRECTORY="$HOME/.tmux/plugins/tpm"

has() {
	type "$1" > /dev/null 2>&1
}

if has "brew"; then
    echo "Updating Homebrew..."
    brew update && brew upgrade
else
    echo "Installing Homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if !has "brew"; then
    echo "Installing Homebrew failed."
    exit 1
fi

echo "Start brew install..."

brew tap homebrew/bundle
brew bundle
brew cleanup

echo "Brew finished!"

# zsh config
if [ $SHELL != "/usr/local/bin/zsh" ]; then
    chsh -s /usr/local/bin/zsh
fi

# vim config
if [[ ! -d $VIM_DEIN_DIRECTORY ]]; then
  mkdir -p $VIM_DEIN_DIRECTORY
  git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
fi

# tmux config
if [[ ! -d $TMUX_TPM_DIRECTORY ]]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi

echo "Initialization is completed!!"
