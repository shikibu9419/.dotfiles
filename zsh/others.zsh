## history config
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
    && $cmd != (reload|myupdate)  # Original
    && $cmd != (cd|man|cat|rm|mv|cp|mkdir|rmdir|l[sal])
  ]]
}

## plugins
typeset -U PATH path cdpath fpath manpath
eval "$(rbenv init -)"

zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified
zstyle ':notify:*' success-title 'Command finished! (in #{time_elapsed} sec.)'
zstyle ':notify:*' error-title   'Command failed... (in #{time_elapsed} sec.)'
zstyle ':notify:*' command-complete-timeout 15

# others
chpwd() { ls }
setopt IGNOREEOF
setopt auto_cd
setopt no_beep
setopt correct
setopt prompt_subst
setopt no_flow_control
