export LANG=en_US.utf-8
export LC_ALL=en_US.utf-8
export TERM=screen-256color
export EDITOR=nvim
export DOTPATH=~/.dotfiles
export DEVPATH=~/dev

export XDG_CONFIG_HOME=~/.config
export XDG_CACHE_HOME=~/.cache
export XDG_DATA_HOME=~/.local/share

export PIPENV_VENV_IN_PROJECT=true
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/sqlite/lib -L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include -I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/sqlite/include"
export CFLAGS="-I/usr/local/opt/bzip2/include -I/usr/local/opt/zlib/include -I/usr/local/opt/openssl@1.1/include -I$(xcrun --show-sdk-path)/usr/include -Wno-implicit-function-declaration"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig /usr/local/opt/zlib/lib/pkgconfig /usr/local/opt/sqlite/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I/usr/local/opt/tcl-tk/include' --with-tcltk-libs='-L/usr/local/opt/tcl-tk/lib -ltcl8.6 -ltk8.6'"
export ZELLIJ_CONFIG_DIR=$XDG_CONFIG_HOME/zellij

path=(~/.local/bin(N-/) /usr/local/opt/tcl-tk/bin(N-/) ~/.cargo/bin(N-/) $DOTPATH/bin(N-/) /usr/local/opt/bzip2/bin(N-/) /usr/local/opt/gnu-sed/libexec/gnubin/(N-/) /usr/local/opt/coreutils/libexec/gnubin(N-/) $path)
fpath=(~/.zsh/completions(N-/) ~/.zplug/repos/zsh-users/zsh-completions/src(N-/) $fpath)
manpath=(/usr/local/opt/coreutils/libexec/gnuman $manpath)
