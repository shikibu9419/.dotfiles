fpath=(~/.zsh/completions(N-/) ~/.zplug/repos/zsh-users/zsh-completions/src(N-/) $fpath)

#------------------------------------------
# Completion
#------------------------------------------
zstyle ':completion:*' list-colors $LS_COLORS
zstyle ':completion:*' menu select=2
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{a-z}={A-Z}'

setopt no_list_types
setopt print_eight_bit
setopt globdots
setopt extended_glob

## Using with fzf
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
export FZF_COMPLETION_TRIGGER=","

## pip completion
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip
