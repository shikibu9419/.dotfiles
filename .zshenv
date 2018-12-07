export DOTPATH=$HOME/dotfiles
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_CACHE_HOME=$HOME/.cache

export LANG=ja_JP.utf-8
export LC_ALL=ja_JP.utf-8
export TERM=xterm-256color
export EDITOR=vim
export GOPATH=$HOME/go
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home

path=(~/programs/flutter/bin(N-/) ~/Android/Sdk/tools(N-/) ~/Android/Sdk/platform-tools(N-/) \
      $JAVA_HOME(N-/) ~/.cargo/bin(N-/) $GOPATH/bin(N-/) ~/.rbenv/bin(N-/) /usr/local/texlive/2018/bin/x86_64-darwin(N-/) ~/dotfiles/bin(N-/) $path)
fpath=(~/.zplug/repos/zsh-users/zsh-completions/src(N-/) ~/.zsh/completions(N-/) $fpath)
