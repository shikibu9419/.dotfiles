#!/bin/sh

recursive_deploy() {
  if [[ -n $1 ]]; then
    dir=$1
  else
    dir=""
  fi

  for f in $dir/*; do
    [[ $f = ".DS_Store" ]] && continue

    if [[ -f $f ]]; then
      ln -sifF ~/dotfiles/xdg_configs/$f $XDG_CONFIG_HOME/$f
    else
      recursive_deploy $f
    fi
    echo $XDG_CONFIG_HOME/$f
  done
}


cd ~/dotfiles/xdg_configs/

ln -sifF ~/dotfiles/xdg_configs/nvim $XDG_CONFIG_HOME/nvim
ln -sifF ~/dotfiles/xdg_configs/peco $XDG_CONFIG_HOME/peco

echo "$XDG_CONFIG_HOME/nvim"
echo "$XDG_CONFIG_HOME/peco"

recursive_deploy "fish"

echo "\nxdg_configs deployed!"
