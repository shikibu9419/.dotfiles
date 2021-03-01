source ~/.zinit/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

zplugin ice blockf wait lucid atload'zicompinit; zicdreplay' for 'zsh-users/zsh-completions'
zplugin light 'zsh-users/zsh-syntax-highlighting'
zplugin light 'zsh-users/zsh-autosuggestions'
zplugin light 'momo-lab/zsh-abbrev-alias'
zplugin light 'lukechilds/zsh-better-npm-completion'

zplugin light 'lukechilds/zsh-nvm'
zplugin ice pick'init.sh'
zplugin light 'b4b4r07/enhancd'
zplugin ice pick'!*'
zplugin light 'mollifier/cd-gitroot'
zplugin ice pick'!*'
zplugin light 'supercrabtree/k'
# zplugin light 'marzocchi/zsh-notify'
zplugin ice pick'async.zsh'
zplugin light 'mafredri/zsh-async'
zplugin light 'greymd/tmux-xpanes'
zplugin light 'sindresorhus/pure'
zplugin ice if'[[ -n `which jq` ]]'
zplugin light 'b4b4r07/emoji-cli'
zplugin ice pick'init.sh' if'[[ -n `which fzf` ]]'
zplugin light 'shikibu9419/git-fzf-extender'
zplugin light 'bigH/git-fuzzy'


#------------------------------------------
# Plugin config
#------------------------------------------
export PATH="$ZPLUG_REPOS/bigH/git-fuzzy/bin:$PATH"
export FZF_ALT_C_OPTS='--select-1 --exit-0'

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
