#!/bin/sh

strong_msg() {
  if has "printf"; then
    printf "\e[37;1m$1\e[m\n"
  else
    echo -e "\e[37;1m$1\e[m"
  fi
}

cd $DOTPATH
for f in .??*; do
	[ $f = ".git" -o $f = ".gitignore" ] && continue
	ln -sifF $DOTPATH/$f ~/$f
	echo $f
done

strong_msg "Dotfiles were deployed!\n"
