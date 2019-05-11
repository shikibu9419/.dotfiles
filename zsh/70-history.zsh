setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt HIST_FIND_NO_DUPS

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}
  [[
    ## excluded commands
    $#line -ge 5
    && $cmd != (reload|(edit|cd)env|myupdate|gpush(|f))  # Original
    && $cmd != (l[sal]|g[acd]|t[kl][swp])                # aliases
    && $cmd != (cd|man|cat|rm|rmdir|mv)
  ]]
}
