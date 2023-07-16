# open tmux / tmuximum only if terminal is Alacritty
if [[ -z $TMUX && $ON_ALACRITTY = 'ok' ]]; then
  cmd=tmuximum
  [[ -z $(tmux list-sessions) ]] && cmd=tmux
  $cmd && exit
fi

# on Rio Terminal: Open Zellij
if [[ -z $ZELLIJ && $__CFBundleIdentifier = 'com.raphaelamorim.rio' ]]; then
  zellij
fi

source $DOTPATH/zsh/plugins.zsh
source $DOTPATH/zsh/appearance.zsh
source $DOTPATH/zsh/functions.zsh
source $DOTPATH/zsh/keybinds.zsh
source $DOTPATH/zsh/aliases.zsh
source $DOTPATH/zsh/completions.zsh
source $DOTPATH/zsh/others.zsh

source /usr/local/opt/asdf/libexec/asdf.sh

source <(starship init zsh --print-full-init)

[ -f ~/.zshrc.local ] && source ~/.zshrc.local
