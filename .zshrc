for file in ~/.zsh/[0-9]*.zsh
do
	source "$file"
done


#------------------------------------------
# PATH
#------------------------------------------
typeset -U path cdpath fpath manpath

path=(${path} ${HOME}/.rbenv/bin ${GOPATH}/bin(N-/) ${HOME}/Android/Sdk/tools(N-/) ${HOME}/Android/Sdk/platform-tools(N-/) ${HOME}/utils(N-/))

eval "$(rbenv init -)"


#------------------------------------------
# Completion
#------------------------------------------
autoload -U compinit
compinit
fpath=(/usr/local/share/zsh-completions(N-/) $fpath)

zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select=2
setopt no_list_types
setopt print_eight_bit
setopt globdots
setopt extended_glob


#------------------------------------------
# History
#------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups
setopt share_history


#------------------------------------------
# Options
#------------------------------------------
setopt auto_cd
setopt no_beep
setopt correct
setopt prompt_subst

bindkey -v	# http://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9
chpwd() { ls }
