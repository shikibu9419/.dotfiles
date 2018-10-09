if [[ -z $TMUX ]]; then
  tmux && exit
fi

path=(/usr/local/opt/imagemagick@6/bin(N-/) ~/programs/flutter/bin(N-/) ~/Android/Sdk/tools(N-/) ~/Android/Sdk/platform-tools(N-/) \
      $JAVA_HOME(N-/) ~/.cargo/bin(N-/) $GOPATH/bin(N-/) ~/.rbenv/bin(N-/) ~/dotfiles/bin(N-/) $path)
fpath=(~/.zplug/repos/zsh-users/zsh-completions/src(N-/) ~/.zsh/completions(N-/) $fpath)

source ~/.zsh/plugins.zsh
source ~/.zsh/appearance.zsh
source ~/.zsh/keymaps.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/history_config.zsh

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
