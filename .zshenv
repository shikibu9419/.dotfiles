export XDG_CONFIG_HOME=~/.config
export XDG_DATA_HOME=~/.local/share
export XDG_CACHE_HOME=~/.cache
export DOTPATH=~/.dotfiles
export GOPATH=~/.go

export LANG=ja_JP.utf-8
export LC_ALL=ja_JP.utf-8
export TERM=xterm-256color
export EDITOR=vim

path=($DOTPATH/bin(N-/) ~/programs/flutter/bin(N-/) $GOPATH/bin(N-/) ~/.cargo/bin(N-/) \
      ~/.rbenv/bin(N-/) ~/Android/Sdk/tools(N-/) ~/Android/Sdk/platform-tools(N-/) $path)
