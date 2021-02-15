export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export TERM=screen-256color
export EDITOR=nvim
export DOTPATH=~/.dotfiles
export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

path=(~/.cargo/bin(N-/) $DOTPATH/bin(N-/) /usr/local/opt/gnu-sed/libexec/gnubin/(N-/) /usr/local/opt/coreutils/libexec/gnubin(N-/) $path)
fpath=(~/.zsh/completions(N-/) ~/.zplug/repos/zsh-users/zsh-completions/src(N-/) $fpath)
manpath=(/usr/local/opt/coreutils/libexec/gnuman $manpath)
