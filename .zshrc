if [[ -z $TMUX ]]; then
  cmd=tmuximum
  [[ -z $(tmux list-sessions) ]] && cmd=tmux
  $cmd && exit
fi

for f in $DOTPATH/zsh/[0-9]*.zsh; do
  source $f
done
