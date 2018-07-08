#!/bin/sh

source $DOTPATH/init/utils.sh

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

# FISH
if has "tee"; then
  echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
  echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
fi

if [ $SHELL != $(which fish) ]; then
  chsh -s $(which fish)
fi

echo "FISH: done."

# Vim
if [[ ! -d $VIM_DEIN_DIRECTORY ]]; then
  mkdir -p $VIM_DEIN_DIRECTORY
  git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
fi
echo "Vim: done."

# Tmux
if [[ ! -d $TMUX_TPM_DIRECTORY ]]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_DIRECTORY
fi
echo "Tmux: done."

# Docker
mkdir $DOTPATH/.zsh/completions
cp $DOCKER_COMPLETION_PATH/docker.zsh-completion $DOTPATH/.zsh/completions/_docker
cp $DOCKER_COMPLETION_PATH/docker-compose.zsh-completion $DOTPATH/.zsh/completions/_docker-compose
cp $DOCKER_COMPLETION_PATH/docker-machine.zsh-completion $DOTPATH/.zsh/completions/_docker-machine
echo "Docker: done."

# Python
pip install --upgrade setuptools
pip install --upgrade pip
pip3 install neovim
echo "Python: done."

# Ricty
if [[ -d /usr/local/opt/ricty/share/fonts ]]; then
  for font in /usr/local/opt/ricty/share/fonts/*.ttf; do
    cp $font ~/Library/Fonts/
  done

  fc-cache -vf
fi
echo "Ricty: done."

# VS Code
sh ~/dotfiles/init/vscode/setup.sh
echo "VS Code: done."

result_msg "Initialization is completed!!"
