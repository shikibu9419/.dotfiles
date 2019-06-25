typeset -U PATH path cdpath fpath manpath
eval "$(rbenv init -)"

zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified
zstyle ':notify:*' success-title 'Command finished! (in #{time_elapsed} sec.)'
zstyle ':notify:*' error-title   'Command failed... (in #{time_elapsed} sec.)'
zstyle ':notify:*' command-complete-timeout 15

chpwd() { ls }
setopt IGNOREEOF
setopt auto_cd
setopt no_beep
setopt correct
setopt prompt_subst
setopt no_flow_control
