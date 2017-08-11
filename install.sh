#!/bin/bash

has(){
	type "$1" > /dev/null 2>&1
}

# initialize or deploy

if has "brew"; then
	# update
	# install...
fi

if has "git"; then
	# git clone~
elif has "curl" || has "wget"; then
	# download tarball
fi

# change zsh
# rbenv
# Python enviroment
