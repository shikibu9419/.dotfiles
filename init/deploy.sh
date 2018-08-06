#!/bin/sh

source $DOTPATH/init/_utils.sh

cd $DOTPATH

for f in .??*; do
	[[ $f = ".git" ]] && continue
	[[ $f = ".gitignore" ]] && continue
	[[ $f = ".DS_Store" ]] && continue

	ln -sifF $DOTPATH/$f ~/$f
	echo $f
done

success_msg "Dotfiles deployed!"
