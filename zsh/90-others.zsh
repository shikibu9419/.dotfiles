typeset -U PATH path cdpath fpath manpath
eval "$(rbenv init -)"
eval "$(pyenv init -)"
eval "$(nodenv init -)"

chpwd() { ls }
stty -ixon
setopt auto_cd
setopt no_beep
setopt correct
setopt prompt_subst
