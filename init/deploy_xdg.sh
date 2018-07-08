#!/bin/sh

source $DOTPATH/init/utils.sh

XDG_DOTPATH="$DOTPATH/xdg_configs"

recursive_deploy() {
  if [[ -n $1 ]]; then
    dir=$1
  else
    dir=""
  fi

  for f in $dir/*; do
    [[ $f = ".DS_Store" ]] && continue

    if [[ -f $f ]]; then
      ln -sifF $XDG_DOTPATH/$f $XDG_CONFIG_HOME/$f
    else
      recursive_deploy $f
    fi
    echo $XDG_CONFIG_HOME/$f
  done
}


cd $XDG_DOTPATH/

ln -sifF $XDG_DOTPATH/nvim $XDG_CONFIG_HOME/nvim
ln -sifF $XDG_DOTPATH/peco $XDG_CONFIG_HOME/peco

echo "$XDG_CONFIG_HOME/nvim"
echo "$XDG_CONFIG_HOME/peco"

recursive_deploy "fish"

result_msg "xdg_configs deployed!"
