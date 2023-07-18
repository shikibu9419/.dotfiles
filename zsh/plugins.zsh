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

# auto suggestion
zinit light zsh-users/zsh-autosuggestions
# abbr alias like fish
zinit light momo-lab/zsh-abbrev-alias
# syntax highlighting
zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions
# enhanced cd command
zinit ice pick'init.sh'
zinit light b4b4r07/enhancd
# rich ls command
zinit light supercrabtree/k
# cd to root of git project
zinit light mollifier/cd-gitroot
# tmux-based terminal divider
zinit light greymd/tmux-xpanes
# zinit light 'marzocchi/zsh-notify'
# dependencies
zinit ice pick'async.zsh'
zinit light mafredri/zsh-async
# emoji command
zinit ice if'[[ -n `which jq` ]]'
zinit light b4b4r07/emoji-cli
# git with fzf (original)
zinit ice pick'init.sh' if'[[ -n `which fzf` ]]'
zinit light shikibu9419/git-fzf-extender
# git with fzf
zinit ice as'program' pick'bin/git-fuzzy'
zinit light bigH/git-fuzzy
# :sparkle: -> <sparkle emoji>
zinit ice as'program' pick'emojify'
zinit light mrowa44/emojify
# completion of npm
zinit light lukechilds/zsh-better-npm-completion

#------------------------------------------
# Plugin config
#------------------------------------------
export FZF_ALT_C_OPTS='--select-1 --exit-0'
