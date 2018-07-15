source /usr/local/opt/zplug/init.zsh
ZPLUG_REPOS="$HOME/.zplug/repos"

zplug 'zsh-users/zsh-completions', lazy:true
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "b4b4r07/enhancd", use:init.sh
zplug "arks22/tmuximum", use:'!*'
zplug "mollifier/cd-gitroot", use:'!*'
zplug "supercrabtree/k", use:'!*'
# zplug "b4b4r07/emoji-cli"
# zplug "b4b4r07/zsh-gomi"

zplug load


#------------------------------------------
# Plugin Setting
#------------------------------------------
# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern cursor)
typeset -A ZSH_HIGHLIGHT_STYLES

# command
ZSH_HIGHLIGHT_STYLES[command]='fg=013'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=013'
ZSH_HIGHLIGHT_STYLES[alias]='fg=013'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=013'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=013'
ZSH_HIGHLIGHT_STYLES[globbing]='none'

# args
ZSH_HIGHLIGHT_STYLES[path]='fg=111'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=111'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=111'
# ZSH_HIGHLIGHT_STYLES[arg0]='fg=111'
# ZSH_HIGHLIGHT_STYLES[precommand]='fg=111'

# quote
ZSH_HIGHLIGHT_STYLES[comment]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=yellow'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=yellow'

# errors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=197'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=197'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=197'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=197'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=197'

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
