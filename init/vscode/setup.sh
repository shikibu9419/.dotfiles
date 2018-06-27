#!/bin/sh
ln -sifF ~/dotfiles/init/vscode/settings.json ~/Library/Application\ Support/Code/User/settings.json

while read pkg; do
  code --install-extension $pkg
done < ~/dotfiles/init/vscode/package_list.txt
