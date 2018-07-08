#!/bin/sh

cd ~/dotfiles

for f in .??*; do
	[[ $f = ".git" ]] && continue
	[[ $f = ".gitignore" ]] && continue
	[[ $f = ".DS_Store" ]] && continue

	ln -sifF ~/dotfiles/$f ~/$f
	echo $f
done

echo "\nDotfiles deployed!"
