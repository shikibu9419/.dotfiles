if [[ -z $TMUX ]]; then
  cmd=tmuximum
  [[ -z $(tmux list-sessions) ]] && cmd=tmux
  $cmd && exit
fi

source $DOTPATH/zsh/plugins.zsh
source $DOTPATH/zsh/appearance.zsh
source $DOTPATH/zsh/functions.zsh
source $DOTPATH/zsh/keybinds.zsh
source $DOTPATH/zsh/aliases.zsh
source $DOTPATH/zsh/completions.zsh
source $DOTPATH/zsh/others.zsh
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
