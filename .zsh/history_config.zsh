zshaddhistory() {
  local line=${1%%$'\n'}
  local cmd=${line%% *}

  # 以下の条件をすべて満たすものだけをヒストリに追加する
  [[ ${#line} -ge 5
    && ${cmd} != (exit)
  ]]
}

HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history
setopt HIST_FIND_NO_DUPS
