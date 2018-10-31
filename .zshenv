export LANG=ja_JP.utf-8
export LC_ALL=ja_JP.utf-8
export TERM=xterm-256color
export DOTPATH=$HOME/dotfiles
export EDITOR=vim
export XDG_CONFIG_HOME=$HOME/.config
export GOPATH=$HOME/go
export FZF_ALT_C_OPTS="--select-1 --exit-0"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home

path=(/usr/local/opt/imagemagick@6/bin(N-/) ~/programs/flutter/bin(N-/) ~/Android/Sdk/tools(N-/) ~/Android/Sdk/platform-tools(N-/) \
      $JAVA_HOME(N-/) ~/.cargo/bin(N-/) $GOPATH/bin(N-/) ~/.rbenv/bin(N-/) ~/dotfiles/bin(N-/) $path)
fpath=(~/.zplug/repos/zsh-users/zsh-completions/src(N-/) ~/.zsh/completions(N-/) $fpath)
