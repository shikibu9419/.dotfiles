source ~/.zsh/colors.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/peco_config.zsh
source ~/.zsh/history_config.zsh


#------------------------------------------
# PATH
#------------------------------------------
typeset -U path cdpath fpath manpath

path=(${path} ${HOME}/.rbenv/bin ${GOPATH}/bin(N-/) ${HOME}/Android/Sdk/tools(N-/) ${HOME}/Android/Sdk/platform-tools(N-/) ${HOME}/dotfiles/bin(N-/))

eval "$(rbenv init -)"
eval "$(pyenv init -)"


#------------------------------------------
# Completion
#------------------------------------------
autoload -U compinit
compinit
fpath=(/usr/local/share/zsh-completions $fpath)

zstyle ':completion:*' list-colors "${LS_COLORS}"
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
