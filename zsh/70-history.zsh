zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}
  [[ $#line -ge 5
    && $cmd != (reload|editenv|myupdate|gpushf) # Original commands
    && $cmd != (l[sal]|cd|man)                  # ls/cd/man
    && $cmd != (g[acd]|t[kl][swp]) ]]           # git/tmux aliases
}

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt HIST_FIND_NO_DUPS
