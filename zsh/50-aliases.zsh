autoload -Uz zmv
autoload -U tetris; zle -N tetris

## plugins
abbrev-alias -c t=tmuximum
abbrev-alias -c cdg=cd-gitroot

abbrev-alias -c g=git
abbrev-alias -c ga='git add'
abbrev-alias -c gap='git add -p'
abbrev-alias -c gb='git branch'
abbrev-alias -c gbd='git branch -D'
abbrev-alias -c gbm='git branch -m'
abbrev-alias -c gcl='git clone'
abbrev-alias -c gc='git commit -m'
abbrev-alias -c gca='git commit -am'
abbrev-alias -c gc!='git commit --amend'
abbrev-alias -c gco='git checkout'
abbrev-alias -c gcob='git checkout -b'
abbrev-alias -c gcod='git checkout develop'
abbrev-alias -c gcom='git checkout master'
abbrev-alias -c gd='git diff'
abbrev-alias -c gdc='git diff --cached'
abbrev-alias -c gl='git log'
abbrev-alias -c gp='git push'
abbrev-alias -c gpl='git pull --rebase'
abbrev-alias -c grb='git rebase'
abbrev-alias -c grem='git remote'
abbrev-alias -c grm='git rm'
abbrev-alias -c grs='git reset'
abbrev-alias -c gs='git status'
abbrev-alias -c gst='git stash'
abbrev-alias -c gsta='git stash apply'
abbrev-alias -c gw='git worktree'

## git
alias git='hub'
alias gwa='git worktree add $(git rev-parse --show-cdup).git-worktrees/$1 -b $1'

alias gadd=git_list_add
alias glog=git_extended_log
alias gwork=git_list_worktree
alias gclone='git clone $(pbpaste)'
alias gpush='git push origin $(git branch | grep "*\ " | sed "s/.* //")'
alias gpushf='git push -f origin $(git branch | grep "*\ " | sed "s/.* //")'
alias gremadd='git remote add origin $(pbpaste)'

alias gcom='hub compare'
alias gpr='hub pull-request'
alias gsee='hub browse'
alias fpd='git diff --stat | fpp'
alias fps='git status | fpp'
alias ghget='ghq get $(pbpaste)'
alias remind='git remind status'

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

## others
abbrev-alias -c v=nvim
abbrev-alias -g G="| grep"
abbrev-alias -g E='| emojify'
abbrev-alias -g ...='../..'
abbrev-alias -g ....='../../..'

alias crop='(){ for f in $@; do pdfcrop $f $f; done }'
alias reload='source ~/.zshenv && source ~/.zshrc'
alias vs=vscode_open_project

alias ls='gls --color=auto'
alias grep='grep --color=auto'
alias la='ls -al'
alias ll='ls -l'
alias cp='cp -r'
alias mkdir='mkdir -p'
alias wmv='noglob zmv -W'
