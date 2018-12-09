if [[ -z $TMUX ]]; then
  if [[ -n $(tmux list-sessions) ]]; then
    cmd=tmuximum
  else
    cmd=tmux
  fi
  $cmd && exit
fi

for f in $DOTPATH/zsh/[0-9]*.zsh; do
  source $f
done
