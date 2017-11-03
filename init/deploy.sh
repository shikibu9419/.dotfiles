#!/bin/zsh

cd ~/dotfiles/

for f in .??*
do
	[[ "${f}" = ".git" ]] && continue
	[[ "${f}" = ".gitignore" ]] && continue

	ln -sifF ~/dotfiles/${f} ~/${f}
	echo "${f}"
done

echo "Dotfiles deployed!"
