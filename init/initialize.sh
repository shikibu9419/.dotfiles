#!/bin/sh

VIM_DEIN_DIRECTORY="$DOTPATH/.vim/dein/repos/github.com/Shougo/dein.vim"
TMUX_TPM_DIRECTORY="$HOME/.tmux/plugins/tpm"
DOCKER_COMPLETION_PATH="/Applications/Docker.app/Contents/Resources/etc"

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

# Editors
echo "Vim..."
if [ ! -d $VIM_DEIN_DIRECTORY ]; then
  mkdir -p $VIM_DEIN_DIRECTORY
  git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
fi

echo "VS Code..."
sh $DOTPATH/init/vscode/initialize.sh

# Tmux
echo "Tmux..."
if [ ! -d $TMUX_TPM_DIRECTORY ]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_DIRECTORY
fi

# Docker
echo "Docker..."
mkdir $DOTPATH/.zsh/completions
cp $DOCKER_COMPLETION_PATH/docker.zsh-completion $DOTPATH/.zsh/completions/_docker
cp $DOCKER_COMPLETION_PATH/docker-compose.zsh-completion $DOTPATH/.zsh/completions/_docker-compose
cp $DOCKER_COMPLETION_PATH/docker-machine.zsh-completion $DOTPATH/.zsh/completions/_docker-machine

# Programing Languages
echo "gem..."
ln -sifF $DOTPATH/init/rbenv-default-gems ~/.rbenv/default-gems

echo "pip..."
pip install --upgrade setuptools
pip install --upgrade pip
pip install --upgrade pygments
pip3 install neovim

echo "Rust..."
curl https://sh.rustup.rs -sSf | sh

strong_msg "Initialization is completed!!\n"
