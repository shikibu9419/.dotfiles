source /usr/local/opt/zplug/init.zsh
ZPLUG_REPOS="$HOME/.zplug/repos"

zplug 'zsh-users/zsh-completions', lazy:true
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions", defer:2
zplug "lukechilds/zsh-nvm"
zplug "lukechilds/zsh-better-npm-completion", defer:2
zplug "b4b4r07/enhancd", use:init.sh
zplug "mollifier/cd-gitroot", use:'!*'
zplug "supercrabtree/k", use:'!*'
# zplug "b4b4r07/emoji-cli"
# zplug "b4b4r07/zsh-gomi"

zplug load

#------------------------------------------
# Plugin Setting
#------------------------------------------
## zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern cursor)
typeset -A ZSH_HIGHLIGHT_STYLES

### command
ZSH_HIGHLIGHT_STYLES[command]='fg=133'
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=133'
ZSH_HIGHLIGHT_STYLES[alias]='fg=133'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=133'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=133'
ZSH_HIGHLIGHT_STYLES[globbing]='none'

### args
ZSH_HIGHLIGHT_STYLES[path]='fg=111'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=111'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=111'
# ZSH_HIGHLIGHT_STYLES[arg0]='fg=111'
# ZSH_HIGHLIGHT_STYLES[precommand]='fg=111'

### string
ZSH_HIGHLIGHT_STYLES[comment]='fg=002'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=002'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=002'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=002'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]='fg=002'

### errors
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=red'

## other plugins
export FZF_ALT_C_OPTS="--select-1 --exit-0"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

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
