#!/bin/sh
DOT_DIRECTORY="$DOTPATH/init/vscode"
SYNC_DESTINATION_DIRECTORY="$HOME/Library/Application Support/Code/User"

ln -sifF $DOT_DIRECTORY/settings.json $SYNC_DESTINATION_DIRECTORY/settings.json
ln -sifF $DOT_DIRECTORY/keybindings.json $SYNC_DESTINATION_DIRECTORY/keybindings.json

while read pkg; do
  code --install-extension $pkg
done < $DOT_DIRECTORY/package_list.txt
