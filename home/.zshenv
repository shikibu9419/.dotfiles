export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export TERM=screen-256color
export EDITOR=nvim
export DOTPATH=~/.dotfiles
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export GOPATH=~/.go
export PIPENV_VENV_IN_PROJECT=true
export FZF_ALT_C_OPTS='--select-1 --exit-0'

path=($DOTPATH/bin(N-/) ~/programs/flutter/bin(N-/) $GOPATH/bin(N-/) ~/.cargo/bin(N-/) \
      ~/.rbenv/bin(N-/) ~/Android/Sdk/tools(N-/) ~/Android/Sdk/platform-tools(N-/)     \
      /usr/local/opt/coreutils/libexec/gnubin(N-/) $path)
fpath=(~/.zsh/completions(N-/) ~/.zplug/repos/zsh-users/zsh-completions/src(N-/) $fpath)
manpath=(/usr/local/opt/coreutils/libexec/gnuman $manpath)
