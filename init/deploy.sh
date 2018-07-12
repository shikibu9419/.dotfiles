#!/bin/sh

source $DOTPATH/init/utils.sh

cd $DOTPATH

for f in .??*; do
	[[ $f = ".git" ]] && continue
	[[ $f = ".gitignore" ]] && continue
	[[ $f = ".DS_Store" ]] && continue

	ln -sifF $DOTPATH/$f ~/$f
	echo $f
done

result_msg "Dotfiles deployed!"
