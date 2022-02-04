source ~/.local/share/zinit/zinit.git/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

zinit ice blockf wait lucid atload'zicompinit; zicdreplay' for 'zsh-users/zsh-completions'
zinit light 'zsh-users/zsh-syntax-highlighting'
zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'momo-lab/zsh-abbrev-alias'
zinit light 'lukechilds/zsh-better-npm-completion'

zinit light 'lukechilds/zsh-nvm'
# Enhanced cd command
zinit ice pick'init.sh'
zinit light 'b4b4r07/enhancd'
# zinit ice pick'!*'
zinit light 'mollifier/cd-gitroot'
zinit ice pick'!*'
zinit light 'supercrabtree/k'
# zinit light 'marzocchi/zsh-notify'
zinit ice pick'async.zsh'
zinit light 'mafredri/zsh-async'
zinit light 'greymd/tmux-xpanes'
zinit light 'sindresorhus/pure'
zinit ice if'[[ -n `which jq` ]]'
zinit light 'b4b4r07/emoji-cli'

zinit ice pick'init.sh' if'[[ -n `which fzf` ]]'
zinit light 'shikibu9419/git-fzf-extender'

zinit ice as"program" pick"bin/git-fuzzy"
zinit light bigH/git-fuzzy


#------------------------------------------
# Plugin config
#------------------------------------------
export FZF_ALT_C_OPTS='--select-1 --exit-0'
