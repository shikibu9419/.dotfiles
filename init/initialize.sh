#!/bin/sh
set -e

VIM_DEIN_DIRECTORY="$DOTPATH/.vim/dein/repos/github.com/Shougo/dein.vim"

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

brew tap caskroom/cask
brew tap homebrew/dupes
brew tap homebrew/apache

echo "Installing formulae..."

local -a install_formulae=(
    'coreutils'
    'git'
    'zsh'
    'zsh-completions'
    'tmux'
    'reattach-to-user-namespace'
    'pyenv'
    'rbenv'
    'ruby-build'
    'gnuplot'
    'go'
    'sqlite'
    'mysql'
    'httpd24'
    'vim --with-lua'
    'ctags'
    'ghq'
    'peco'
    'hub'
    'highlight'
)

for formula in ${install_formulae[@]}; do
    brew install $formula && echo "Installed $formula."
done

# cask install
local -a install_formulae=(
    'google-chrome'
    '4k-video-downloader'
    'iterm2'
    'sourcetree'
    'docker-toolbox'
    'mactex'
    'mendeley'
    'skim'
    'skype'
    '0xed'
    'atom'
    'sublime-text'
)

for formula in ${install_formulae[@]}; do
    brew cask install $formula && echo "Installed $formula."
done

brew cleanup

# zsh config
if [ $SHELL != "/usr/local/bin/zsh" ]; then
    chsh -s /usr/local/bin/zsh
fi

# vim config
mkdir -p $VIM_DEIN_DIRECTORY
git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY

# ruby config
# gem install bundle
# bundle install

echo "Initialization is complete!!"
