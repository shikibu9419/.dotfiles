source /usr/local/opt/zplug/init.zsh

zplug "zsh-users/zsh-completions", lazy:true
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/zsh-gomi", as:command, use:bin
zplug "mollifier/cd-gitroot", use:'!*'
zplug "arks22/tmuximum", as:command

zplug load --verbose


#------------------------------------------
# Plugin Setting
#------------------------------------------
cd-gitroot() {
  unfunction cd-gitroot
  . ~/.zplug/repos/mollifier/cd-gitroot/cd-gitroot
}
alias cdg=cd-gitroot
