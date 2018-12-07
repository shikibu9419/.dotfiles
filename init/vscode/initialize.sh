#!/bin/sh
CONFIG_DIR="$DOTPATH/init/vscode"
SYNC_DESTINATION_DIR="$HOME/Library/Application Support/Code/User"

ln -sifF $CONFIG_DIR/settings.json    $SYNC_DESTINATION_DIR/settings.json
ln -sifF $CONFIG_DIR/keybindings.json $SYNC_DESTINATION_DIR/keybindings.json

while read pkg; do
  code --install-extension $pkg
done < $CONFIG_DIR/package_list.txt
