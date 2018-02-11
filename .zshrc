if [[ -z "$TMUX" ]]; then
  tmux && exit
fi

source ~/.zsh/plugins.zsh
source ~/.zsh/colors.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/peco_config.zsh
source ~/.zsh/history_config.zsh


#------------------------------------------
# Initialize
#------------------------------------------
# fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zplug/repos/zsh-users/zsh-completions/src ~/.zsh/completion $fpath)
typeset -U path PATH cdpath fpath manpath
eval "$(rbenv init -)"
eval "$(pyenv init -)"


#------------------------------------------
# Completion
#------------------------------------------
autoload -U compinit
# compinit

zstyle ':completion:*' list-colors "$LS_COLORS"
zstyle ':completion:*' menu select=2
setopt no_list_types
setopt print_eight_bit
setopt globdots
setopt extended_glob


#------------------------------------------
# Options
#------------------------------------------
setopt auto_cd
setopt no_beep
setopt correct
setopt prompt_subst

bindkey -v	# http://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9
chpwd() { ls }
