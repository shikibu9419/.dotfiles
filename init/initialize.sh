#!/bin/sh

DOCKER_COMPLETIONS_PATH="/Applications/Docker.app/Contents/Resources/etc"
ZSH_COMPLETIONS_PATH="$HOME/.zsh/completions"
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
  error "Installing Homebrew failed."
fi

# brew install
notice "Start brew install."
brew tap homebrew/bundle
brew bundle
brew cleanup
strong_msg "Brew install finished!\n"

notice "Other settings..."

# Shell
echo "Shell..."
if has "tee"; then
  echo $(which zsh) | sudo tee -a /etc/shells
  echo $(which fish) | sudo tee -a /etc/shells
else
  sudo echo $(which zsh) >> /etc/shells; echo $(which zsh)
  sudo echo $(which fish) >> /etc/shells; echo $(which zsh)
fi
cp /usr/local/opt/global/share/gtags/gtags.conf ~/.globalrc
npm install -g pure-prompt

# Editor
echo "VS Code..."
sh $DOTPATH/init/vscode/initialize.sh

# Docker
echo "Docker..."
if [ ! -d $ZSH_COMPLETIONS_PATH ] && mkdir -p $ZSH_COMPLETIONS_PATH
cp $DOCKER_COMPLETIONS_PATH/docker.zsh-completion $ZSH_COMPLETIONS_PATH/_docker
cp $DOCKER_COMPLETIONS_PATH/docker-compose.zsh-completion $ZSH_COMPLETIONS_PATH/_docker-compose
cp $DOCKER_COMPLETIONS_PATH/docker-machine.zsh-completion $ZSH_COMPLETIONS_PATH/_docker-machine

# Programing Languages
echo "gem..."
if [ ! -d ~/.rbenv ] && mkdir ~/.rbenv
ln -sifF $DOTPATH/init/rbenv-default-gems ~/.rbenv/default-gems

echo "pip..."
pip install --upgrade setuptools
pip install --upgrade pip
pip install --upgrade pygments
pip3 install neovim

echo "Rust..."
curl https://sh.rustup.rs -sSf | sh

strong_msg "Initialization is completed!!\n"
