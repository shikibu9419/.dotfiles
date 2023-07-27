# .dotfiles ![](https://img.shields.io/badge/platform-macOS-lightgray.svg) [![MIT License](http://img.shields.io/badge/license-MIT-green.svg?style=flat)](./doc/LICENSE.txt)

My powerful and fashionable development environment :muscle:


## Installation

Download this repository

```shell
bash <(curl -fsSL git.io/shikibu.info)
cd ~/.dotfiles
```

First, install app using brew before initialization

```shell
brew tap homebrew/bundle && HOMEBREW_CASK_OPTS="--appdir=/Applications" brew bundle && brew cleanup
```


Then let's initialize and deploy!
```shell
make install
```


## Updating

```shell
> dotupdate
```

## Help

```shell
> make help
list     List files to be deployed
init     Initialize macOS environment
deploy   Deploy dotfiles
install  Initialize and deploy
update   Update dotfiles, submodules and other plugins
help     Display help message
```

## Tools
- Text Editor: **VSCode, Neovim (for VSC settings)**
- Shell: **Zsh**
- Terminal: **Alacritty**
