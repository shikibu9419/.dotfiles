#!/bin/sh

set -e
DOCKER_COMPLETIONS_PATH=/Applications/Docker.app/Contents/Resources/etc
ZSH_COMPLETIONS_PATH=~/.zsh/completions

has() {
  type "$1" > /dev/null 2>&1
}

notice() {
  echo ==================================================
  echo $1
  echo ==================================================
}

strong() {
  msg="\e[37;1m$1\e[m\n"
  if has 'printf'; then
    printf $msg
  else
    echo -e $msg
  fi
}

error() {
  echo $1 1>&2
  echo 'Initialization failed.' 1>&2
  exit 1
}


cd $DOTPATH

## Homebrew setting
if has 'brew'; then
  notice 'Update Homebrew...'
  brew update && brew upgrade
else
  notice 'Install Homebrew...'
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

has 'brew' || error "Can't install Homebrew."

## brew install
notice 'Start install formulas.'
brew tap homebrew/bundle
brew bundle
brew cleanup
strong 'Installation of formulas finished!\n'

notice 'Other settings...'

## Shell
strong 'Shell:'
if has 'tee'; then
  echo $(which zsh)  | sudo tee -a /etc/shells
  echo $(which fish) | sudo tee -a /etc/shells
else
  sudo echo $(which zsh)  >> /etc/shells && echo $(which zsh)
  sudo echo $(which fish) >> /etc/shells && echo $(which fish)
fi
chsh -s $(which zsh)
cp /usr/local/opt/global/share/gtags/gtags.conf ~/.globalrc
npm install -g pure-prompt

## Editor
strong 'VS Code:'
echo $DOTPATH/init/vscode-extensions | while read pkg; do
  code --install-extension $pkg
done

## Docker
strong 'Docker:'
[ -d $ZSH_COMPLETIONS_PATH ] || mkdir -p $ZSH_COMPLETIONS_PATH
cp $DOCKER_COMPLETIONS_PATH/docker.zsh-completion         $ZSH_COMPLETIONS_PATH/_docker
cp $DOCKER_COMPLETIONS_PATH/docker-compose.zsh-completion $ZSH_COMPLETIONS_PATH/_docker-compose
cp $DOCKER_COMPLETIONS_PATH/docker-machine.zsh-completion $ZSH_COMPLETIONS_PATH/_docker-machine

strong 'Rust:'
curl https://sh.rustup.rs -sSf | sh

## Programing Languages
strong 'gem:'
[ -d ~/.rbenv ] || mkdir ~/.rbenv
ln -sifF $DOTPATH/init/rbenv-default-gems ~/.rbenv/default-gems

strong 'pip:'
pip3 install --upgrade setuptools
pip3 install --upgrade pip3
pip3 install -r $DOTPATH/init/pip-requirements

## Default writes
bash $DOTPATH/init/default-writes.sh


strong 'Initialization finished successfully!!'
cat <<EOF
Please run this commands to complete initialize truly.
> rustup component add rls-preview rust-analysis rust-src

And please rewrite ~/.globalrc as following diff.
37   default:\
38 - :tc=native:
   + :tc=native:tc=pygments:
EOF
