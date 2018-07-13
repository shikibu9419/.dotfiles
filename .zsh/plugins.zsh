source /usr/local/opt/zplug/init.zsh
ZPLUG_REPOS="$HOME/.zplug/repos"

zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-autosuggestions", defer:2
# zplug "b4b4r07/emoji-cli"
# zplug "b4b4r07/zsh-gomi"
zplug "arks22/tmuximum", use:'!*'
zplug "mollifier/cd-gitroot", use:'!*'
zplug "supercrabtree/k", use:'!*'

zplug load --verbose


#------------------------------------------
# Plugin Setting
#------------------------------------------
cd-gitroot() {
  unfunction cd-gitroot
  . $ZPLUG_REPOS/mollifier/cd-gitroot/cd-gitroot

  autoload -Uz cd-gitroot
}

k() {
  unfunction k
  . $ZPLUG_REPOS/supercrabtree/k/k.sh

  k "$@"
}
