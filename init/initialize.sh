#!/bin/sh
source $DOTPATH/init/_utils.sh
cd $DOTPATH

# set Homebrew
if has "brew"; then
  notice "Updating Homebrew..."
  brew update && brew upgrade
else
  notice "Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! has "brew"; then
  error_msg "Installing Homebrew failed."
fi

# brew install
notice "Start brew install."
brew tap homebrew/bundle
brew bundle
brew cleanup
success_msg "Brew install finished!"

# Shell
notice "Shell..."
if has "tee"; then
  echo $(which zsh) | sudo tee -a /etc/shells
  echo $(which fish) | sudo tee -a /etc/shells
else
  sudo echo $(which zsh) >> /etc/shells; echo $(which zsh)
  sudo echo $(which fish) >> /etc/shells; echo $(which zsh)
fi
cp /usr/local/opt/global/share/gtags/gtags.conf ~/.globalrc

# prompt setting
npm install -g pure-prompt

# Editors
notice "Vim..."
if [ ! -d $VIM_DEIN_DIRECTORY ]; then
  mkdir -p $VIM_DEIN_DIRECTORY
  git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
fi

notice "VS Code..."
sh $DOTPATH/init/vscode/initialize.sh

# Tmux
notice "Tmux..."
if [ ! -d $TMUX_TPM_DIRECTORY ]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_DIRECTORY
fi

# Docker
notice "Docker..."
mkdir $DOTPATH/.zsh/completions
cp $DOCKER_COMPLETION_PATH/docker.zsh-completion $DOTPATH/.zsh/completions/_docker
cp $DOCKER_COMPLETION_PATH/docker-compose.zsh-completion $DOTPATH/.zsh/completions/_docker-compose
cp $DOCKER_COMPLETION_PATH/docker-machine.zsh-completion $DOTPATH/.zsh/completions/_docker-machine

# Programing Languages
notice "gem..."
ln -sifF $DOTPATH/rbenv-default-gems ~/.rbenv/default-gems

notice "Rust..."
curl https://sh.rustup.rs -sSf | sh
rustup component add rls-preview rust-analysis rust-src

notice "pip..."
pip install --upgrade setuptools
pip install --upgrade pip
pip install --upgrade pygments
pip3 install neovim

# Terminal
notice "iTerm..."
git clone --depth=1 https://github.com/mbadolato/iTerm2-Color-Schemes

notice "Alacritty..."
brew install --HEAD mscharley/homebrew/alacritty

success_msg "Initialization is completed!!"
