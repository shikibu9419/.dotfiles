#!/bin/sh
pkglist=(
abusaidm.html-snippets
dbaeumer.vscode-eslint
eg2.tslint
formulahendry.code-runner
mkaufman.HTMLHint
ms-python.python
msjsdiag.debugger-for-chrome
PeterJausovec.vscode-docker
vscodevim.vim
)

for pkg in ${pkglist[@]}; do
  echo $pkg
  # code --install-extension $pkg
done

ln -sifF ~/dotfiles/init/vscode_settings.json ~/Library/Application Support/Code/User/settings.json
