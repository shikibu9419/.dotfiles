#!/bin/sh

source $DOTPATH/init/_utils.sh
cd $DOTPATH

# set Homebrew
break_point "Homebrew"
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
break_point "brew install"
notice "Start brew install."
brew tap homebrew/bundle
brew bundle
brew cleanup
success_msg "Brew install finished!"

# Shell
break_point "Shell"
notice "Shell..."
if has "tee"; then
  echo $(which zsh) | sudo tee -a /etc/shells
  echo $(which fish) | sudo tee -a /etc/shells
else
  sudo echo $(which zsh) >> /etc/shells; echo $(which zsh)
  sudo echo $(which fish) >> /etc/shells; echo $(which zsh)
fi
cp /usr/local/opt/global/share/gtags/gtags.conf ~/.globalrc

# Vim
break_point "Vim"
notice "Vim..."
if [ ! -d $VIM_DEIN_DIRECTORY ]; then
  mkdir -p $VIM_DEIN_DIRECTORY
  git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
fi

# VS Code
break_point "VS Code"
notice "VS Code..."
sh $DOTPATH/init/vscode/initialize.sh

# Tmux
break_point "Tmux"
notice "Tmux..."
if [ ! -d $TMUX_TPM_DIRECTORY ]; then
  git clone https://github.com/tmux-plugins/tpm $TMUX_TPM_DIRECTORY
fi

# Docker
break_point "Docker"
notice "Docker..."
mkdir $DOTPATH/.zsh/completions
cp $DOCKER_COMPLETION_PATH/docker.zsh-completion $DOTPATH/.zsh/completions/_docker
cp $DOCKER_COMPLETION_PATH/docker-compose.zsh-completion $DOTPATH/.zsh/completions/_docker-compose
cp $DOCKER_COMPLETION_PATH/docker-machine.zsh-completion $DOTPATH/.zsh/completions/_docker-machine

# Rust
break_point "Rust"
notice "Rust..."
curl https://sh.rustup.rs -sSf | sh
rustup component add rls-preview rust-analysis rust-src

# pip
break_point "pip"
notice "pip..."
pip install --upgrade setuptools
pip install --upgrade pip
pip install --upgrade pygments
pip3 install neovim

# iTerm
break_point "iTerm"
notice "iTerm..."
git clone --depth=1 https://github.com/mbadolato/iTerm2-Color-Schemes

# Alacritty (Dependent: Rust)
break_point "Alacritty"
notice "Alacritty..."
brew install --HEAD mscharley/homebrew/alacritty

# Ricty
break_point "Ricty"
notice "Ricty..."
for font in /usr/local/opt/ricty/share/fonts/*.ttf; do
  [ -f $font ] && cp $font ~/Library/Fonts/
done
fc-cache -vf

success_msg "Initialization is completed!!"
