source /usr/local/opt/zplug/init.zsh
ZPLUG_REPOS=~/.zplug/repos

zplug 'zsh-users/zsh-completions', lazy:true
zplug 'zsh-users/zsh-syntax-highlighting', defer:2
zplug 'zsh-users/zsh-autosuggestions', defer:2
zplug "momo-lab/zsh-abbrev-alias", defer:2
zplug 'lukechilds/zsh-better-npm-completion', defer:2
zplug 'lukechilds/zsh-nvm'
zplug 'b4b4r07/enhancd', use:init.sh
zplug 'mollifier/cd-gitroot', use:'!*'
zplug 'supercrabtree/k', use:'!*'
zplug 'marzocchi/zsh-notify'
zplug 'mafredri/zsh-async', from:'github', use:async.zsh
zplug 'greymd/tmux-xpanes'
zplug 'sindresorhus/pure'
zplug 'b4b4r07/zsh-gomi', use:bin
zplug 'b4b4r07/emoji-cli', if:'which jq'
zplug 'bigH/git-fuzzy'
zplug 'shikibu9419/git-fzf-extender', use:init.sh, if:'which fzf'

zplug load


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
