#!/bin/sh
VSCODE_INIT_DIRECTORY="$DOTPATH/init/vscode"

ln -sifF $VSCODE_INIT_DIRECTORY/settings.json ~/Library/Application\ Support/Code/User/settings.json

while read pkg; do
  code --install-extension $pkg
done < $VSCODE_INIT_DIRECTORY/package_list.txt
