source /usr/local/opt/zplug/init.zsh
ZPLUG_REPOS="$HOME/.zplug/repos"

zplug "zsh-users/zsh-completions", lazy:true
zplug "b4b4r07/enhancd", use:init.sh
zplug "b4b4r07/emoji-cli"
zplug "b4b4r07/zsh-gomi"
zplug "arks22/tmuximum", use:'!*'
zplug "mollifier/cd-gitroot", use:'!*'
zplug "supercrabtree/k", use:'!*'

zplug load --verbose


#------------------------------------------
# Plugin Setting
#------------------------------------------
cd-gitroot() {
  unfunction cd-gitroot
  . ~/.zplug/repos/mollifier/cd-gitroot/cd-gitroot

  autoload -Uz cd-gitroot
}
alias cdg=cd-gitroot

k() {
  unfunction k
  . ~/.zplug/repos/supercrabtree/k/k.sh

  k "$@"
}
