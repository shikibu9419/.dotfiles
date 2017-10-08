#!/bin/zsh

cd ~/dotfiles/

echo "Deploying..."

for f in .??*
do
	[[ "${f}" = ".git" ]] && continue
	[[ "${f}" = ".gitignore" ]] && continue
	ln -sif ~/dotfiles/${f} ~/${f}
	echo "${f}"
done

echo "Dotfiles deployed!"
