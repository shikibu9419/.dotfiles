#!/bin/sh
set -e
DOT_DIRECTORY="$HOME/dotfiles"
DOT_TARBALL="https://github.com/shikibu9419/dotfiles/tarball/master"
VIM_DEIN_DIRECTORY="$DOT_DIRECTORY/.vim/dein/repos/github.com/Shougo/dein.vim"

has() {
	type "$1" > /dev/null 2>&1
}

install() {
    if [ -d $DOT_DIRECTORY ]; then
        echo "**warning** $DOT_DIRECTORY will be deleted!!"
        echo "Stop deploying."
        exit 1
    fi

    mkdir $DOT_DIRECTORY

    if has "git"; then
        git clone https://github.com/shikibu9419/dotfiles $DOT_DIRECTORY
    elif has "curl"; then
        curl -fsSLo $HOME/dotfiles.tar.gz $DOT_TARBALL
        tar -zxvf $HOME/dotfiles.tar.gz --strip-components=1 -C $DOT_DIRECTORY
        rm -f $HOME/dotfiles.tar.gz
    fi

    echo "Dotfiles installed!"
}

initialize() {
    if has "brew"; then
        echo "Updating Homebrew..."
        brew update && brew upgrade
    else
        echo "Installing Homebrew..."
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi

    if !has "brew"; then
        echo "Homebrew install failed."
        exit 1
    fi

    brew tap caskroom/cask

    # brew install
    echo "Installing formulae..."

    local -a install_formulae=(
        'coreutils'
        'git'
        'tmux'
        'rbenv'
        'ruby-build'
        'gnuplot'
        'sqlite'
        'mysql'
        'vim --with-lua'
        'ctags'
    )

    ###############
    for formula in ${install_formulae[@]}; do
        brew install $formula && echo "Installed $formula"
    done

    # cask install
    local -a install_formulae=(
        'google-chrome'
        '4k-video-downloader'
        'iterm2'
        'mactex'
    )

    for formula in ${install_formulae[@]}; do
        brew cask install $formula && echo "Installed $formula"
    done

    brew cleanup

    # zsh config
    [ $SHELL != "/usr/local/bin/zsh" ] && chsh -s /usr/local/bin/zsh

    # vim config
    mkdir -p $VIM_DEIN_DIRECTORY
    git clone https://github.com/Shougo/dein.vim.git $VIM_DEIN_DIRECTORY
    ln -s $DOT_DIRECTORY/dein* $DOT_DIRECTORY/.vim/dein/

    echo "Complete initialize!!"
}

usage() {
    name=`basename $0`
    cat <<EOF
Usage:
  $name [command]
Commands:
  init      Initialize your OS X.
  deploy    Deploy my dotfiles.
EOF
    exit 1
}

install

case $1 in
    deploy)
        sh $DOT_DIRECTORY/init/deploy.sh
        ;;
    init)
        initialize
        ;;
    *)
        usage
        ;;
esac

# rbenv -> bundle install
# Python environment (pip?)
# JS environment
