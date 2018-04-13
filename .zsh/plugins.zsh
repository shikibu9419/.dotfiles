source /usr/local/opt/zplug/init.zsh

zplug "zsh-users/zsh-completions", lazy:true
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli"
zplug "mollifier/cd-gitroot", use:'!*'
zplug "b4b4r07/zsh-gomi", as:command, use:bin

zplug load --verbose

#------------------------------------------
# Plugins Setting
#------------------------------------------
cd-gitroot() {
  unfunction cd-gitroot
  . ~/.zplug/repos/mollifier/cd-gitroot/cd-gitroot
}
alias cdg=cd-gitroot
