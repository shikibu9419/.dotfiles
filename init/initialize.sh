#!/bin/sh

set -e
DOCKER_COMPLETIONS_PATH=/Applications/Docker.app/Contents/Resources/etc
ZSH_COMPLETIONS_PATH=~/.zsh/completions
RBENV_DEFAULT_GEMS=https://github.com/sstephenson/rbenv-default-gems.git
DEFAULT_GEMS_URL=https://gist.githubusercontent.com/shikibu9419/c4a6e126b0da47856ee5a8ef04d38cde/raw/rbenv-default-gems
PIP_REQUIREMENTS_URL=https://gist.githubusercontent.com/shikibu9419/8bafc4e6146967d851d0f88567f9d15a/raw/pip-requirements

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

checkdir() {
  [ -d $1 ] || mkdir -p $1
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
  echo $(which xonsh) | sudo tee -a /etc/shells
else
  sudo echo $(which zsh)  >> /etc/shells && echo $(which zsh)
  sudo echo $(which fish) >> /etc/shells && echo $(which fish)
  sudo echo $(which xonsh) >> /etc/shells && echo $(which xonsh)
fi
chsh -s $(which zsh)

## Editor
strong 'VS Code:'
echo $DOTPATH/init/vscode-extensions | while read pkg; do
  code --install-extension $pkg
done

## Docker
strong 'Docker:'
checkdir $ZSH_COMPLETIONS_PATH
for comp in $DOCKER_COMPLETIONS_PATH/*.zsh-completion; do
  file=${comp##*/}
  cp $comp $ZSH_COMPLETIONS_PATH/_${file%.*}
done

## Package managers
strong 'gem:'
checkdir ~/.rbenv
git clone $RBENV_DEFAULT_GEMS ~/.rbenv/plugins/rbenv-default-gems
curl -fsSL $DEFAULT_GEMS_URL -o default-gems && mv default-gems ~/.rbenv

strong 'pip:'
pip3 install --upgrade setuptools
pip3 install --upgrade pip3
pip3 install $(curl -fsSL $PIP_REQUIREMENTS_URL)

## Others
curl https://sh.rustup.rs -sSf | sh
sed -e 's/:tc=native:/:tc=native:tc=pygments:/g' /usr/local/opt/global/share/gtags/gtags.conf > ~/.globalrc

## Default writes
bash $DOTPATH/init/default-writes.sh


strong 'Initialization finished successfully!!'
cat <<EOF
Please run this commands to complete initialize truly.
> rustup component add rls-preview rust-analysis rust-src
EOF
