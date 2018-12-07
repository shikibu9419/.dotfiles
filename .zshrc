if [[ -z $TMUX ]]; then
  if [[ -n $(tmux list-sessions) ]]; then
    cmd=tmuximum
  else
    cmd=tmux
  fi
  $cmd && exit
fi

source $DOTPATH/zsh/plugins.zsh
source $DOTPATH/zsh/appearance.zsh
source $DOTPATH/zsh/keymaps.zsh
source $DOTPATH/zsh/functions.zsh
source $DOTPATH/zsh/history_config.zsh

#------------------------------------------
# Initialize
#------------------------------------------
typeset -U PATH path cdpath fpath manpath
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

#------------------------------------------
# Completion
#------------------------------------------
zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' menu select=2

setopt no_list_types
setopt print_eight_bit
setopt globdots
setopt extended_glob

# pip completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip

#------------------------------------------
# Options
#------------------------------------------
setopt auto_cd
setopt no_beep
setopt correct
setopt prompt_subst

chpwd() { ls }
