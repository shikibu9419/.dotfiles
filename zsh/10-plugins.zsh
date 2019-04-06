source /usr/local/opt/zplug/init.zsh
ZPLUG_REPOS=~/.zplug/repos

zplug 'zsh-users/zsh-completions', lazy:true
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-autosuggestions', defer:2
zplug 'lukechilds/zsh-better-npm-completion', defer:2
zplug 'lukechilds/zsh-nvm'
zplug 'b4b4r07/enhancd', use:init.sh
zplug 'mollifier/cd-gitroot', use:'!*'
zplug 'supercrabtree/k', use:'!*'
zplug 'marzocchi/zsh-notify', use:'!*'
zplug 'mafredri/zsh-async', from:'github', use:'async.zsh'
zplug 'greymd/tmux-xpanes'
zplug 'sindresorhus/pure'
zplug 'b4b4r07/zsh-gomi', use:bin
zplug 'b4b4r07/emoji-cli', if:'which jq'

zplug load

#------------------------------------------
# Plugin config
#------------------------------------------
export FZF_ALT_C_OPTS='--select-1 --exit-0'
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

## zsh-syntax-highlighting
local magenta='fg=177'
local cyan='fg=012'
local yellow='fg=011'

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main pattern cursor)
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_STYLES[command]=$magenta
ZSH_HIGHLIGHT_STYLES[precommand]=$magenta
ZSH_HIGHLIGHT_STYLES[reserved-word]=$magenta
ZSH_HIGHLIGHT_STYLES[commandseparator]=$magenta
ZSH_HIGHLIGHT_STYLES[alias]=$magenta
ZSH_HIGHLIGHT_STYLES[suffix-alias]=$magenta
ZSH_HIGHLIGHT_STYLES[builtin]=$magenta
ZSH_HIGHLIGHT_STYLES[function]=$magenta

ZSH_HIGHLIGHT_STYLES[path]=$cyan
ZSH_HIGHLIGHT_STYLES[path_prefix]=$cyan
ZSH_HIGHLIGHT_STYLES[arg0]=$cyan
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]=$cyan
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]=$cyan
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]=$cyan

ZSH_HIGHLIGHT_STYLES[comment]=$yellow
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]=$yellow
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]=$yellow
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]=$yellow
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument]=$yellow

ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument-unclosed]='fg=red'
ZSH_HIGHLIGHT_STYLES[dollar-quoted-argument-unclosed]='fg=red'

ZSH_HIGHLIGHT_STYLES[globbing]=none
