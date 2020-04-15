autoload -Uz zmv
autoload -U tetris; zle -N tetris

## plugins
abbrev-alias -c t=tmuximum
abbrev-alias -c cdg=cd-gitroot

## git
alias git='hub'

alias gadd=git-extended-add
alias glog=git-extended-log
alias gwork=git-extended-worktree
alias ginit=git-extended-init
alias gclone='git clone $(pbpaste)'
alias gpush='git push origin $(git symbolic-ref --short HEAD)'
alias gpushf='git push --force-with-lease origin $(git symbolic-ref --short HEAD)'
alias gremadd='git remote add origin $(pbpaste)'
alias gwa='git worktree add $(git rev-parse --show-cdup).git-worktrees/$1 -b $1'

abbrev-alias -c g=git
abbrev-alias -c ga='git add'
abbrev-alias -c gap='git add -p'
abbrev-alias -c gb='git branch'
abbrev-alias -c gbd='git branch -D'
abbrev-alias -c gbm='git branch -m'
abbrev-alias -c gbl='git blame'
abbrev-alias -c gcl='git clone'
abbrev-alias -c gc='git commit -m'
abbrev-alias -c gca='git commit --amend'
abbrev-alias -c gco='git checkout'
abbrev-alias -c gcob='git checkout -b'
abbrev-alias -c gcod='git checkout develop'
abbrev-alias -c gcom='git checkout master'
abbrev-alias -c gch='git cherry-pick'
abbrev-alias -c gd='git diff'
abbrev-alias -c gdc='git diff --cached'
abbrev-alias -c gf='git fetch'
abbrev-alias -c gg='git grep'
abbrev-alias -c gl='git log'
abbrev-alias -c gm='git merge'
abbrev-alias -c gpl='git pull --rebase'
abbrev-alias -c gps='git push'
abbrev-alias -c gpsf='git push --force-with-lease'
abbrev-alias -c gr='git restore'
abbrev-alias -c grb='git rebase'
abbrev-alias -c grba='git rebase --abort'
abbrev-alias -c grbc='git rebase --continue'
abbrev-alias -c grbs='git rebase --skip'
abbrev-alias -c grem='git remote'
abbrev-alias -c grm='git rm'
abbrev-alias -c grs='git reset'
abbrev-alias -c gs='git status'
abbrev-alias -c gst='git stash'
abbrev-alias -c gsta='git stash apply'
abbrev-alias -c gw='git worktree'
abbrev-alias -c gwl='git worktree list'
abbrev-alias -c gwp='git worktree prune'

# from external plugins
alias fpd='git diff --stat | fpp'
alias fps='git status | fpp'
alias ghget='ghq get $(pbpaste)'
alias remind='git remind status'

abbrev-alias gcom='git compare'
abbrev-alias gfk='git fork'
abbrev-alias gi='git issue'
abbrev-alias gpr='git pr'
abbrev-alias gbr='git browse'

## tmux
abbrev-alias -c tks='tmux kill-session -t'
abbrev-alias -c tkw='tmux kill-window -t'
abbrev-alias -c tkp='tmux kill-pane -t'
abbrev-alias -c tls='tmux list-sessions -t'
abbrev-alias -c tlw='tmux list-windows -t'
abbrev-alias -c tlp='tmux list-panes -t'

alias xpanes='xpanes --log=$XDG_CACHE_HOME/xpanes-log'
abbrev-alias -c xpc='xpanes -c'
abbrev-alias -c xpd='xpanes -d -c'
abbrev-alias -c xpe='xpanes -e'
abbrev-alias -c xpssh='xpanes --ssh'

## docker
abbrev-alias -c d='docker'
abbrev-alias -c dp='docker ps'
abbrev-alias -c dk='docker kill'
abbrev-alias -c ds='docker stop'
abbrev-alias -c dka='docker ps -q | xargs docker stop | xargs docker rm'

## others
abbrev-alias -c v='nvim'
abbrev-alias -g E='| emojify'
abbrev-alias -g C='| $(pbcopy)'
abbrev-alias -g G='| grep'
abbrev-alias -g P='$(pbpaste)'
abbrev-alias -g '...'='../..'
abbrev-alias -g '....'='../../..'

alias crop='() { for f in $@; do pdfcrop $f $f; done }'
alias temp='() { FNAME="__TEMPLATE__.$1"; nvim $FNAME && rm $FNAME }'
alias reload='source ~/.zshenv && source ~/.zshrc'
alias vs=vscode_open_project
alias gz='tar cvzf $1.tar.gz $1'
alias bz2='tar cvjf $1.tar.gz $1'

alias ls='gls --color=auto'
alias grep='grep --color=auto'
alias la='ls -al'
alias ll='ls -l'
alias cp='cp -r'
alias mkdir='mkdir -p'
alias wmv='noglob zmv -W'
