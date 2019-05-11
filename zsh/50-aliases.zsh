autoload -Uz zmv
autoload -U tetris; zle -N tetris

## plugins
alias t=tmuximum
alias cdg=cd-gitroot
alias -g E='| emojify'

## git
alias git='hub'
alias g='git'
alias ga='git add'
alias gap='git add -p'
alias gb='git branch'
alias gd='git branch -D'
alias gm='git branch -m'
alias gc='git commit -m'
alias gca='git commit -am'
alias gc!='git commit --amend'
alias gcl='git clone'
alias gch='git checkout'
alias gchb='git checkout -b'
alias gchd='git checkout develop'
alias gchm='git checkout master'
alias gd='git diff'
alias gdc='git diff --cached'
alias gl='git log'
alias gp='git push'
alias gpl='git pull --rebase'
alias grb='git rebase'
alias grem='git remote'
alias grm='git rm'
alias grs='git reset'
alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gw='git worktree'
alias gwa='git worktree add $(git rev-parse --show-cdup).git-worktrees/$1 -b $1'
alias gcom='hub compare'
alias gpr='hub pull-request'
alias gsee='hub browse'

alias gclone='git clone $(pbpaste)'
alias gpush='git push origin $(git branch | grep "*\ " | sed "s/.* //")'
alias gpushf='git push -f origin $(git branch | grep "*\ " | sed "s/.* //")'
alias gremadd='git remote add origin $(pbpaste)'
alias gadd=git_list_add
alias glog=git_extended_log
alias gwork=git_list_worktree

alias fpd='git diff --stat | fpp'
alias fps='git status | fpp'
alias ghget='ghq get $(pbpaste)'
alias remind='git remind status'

## tmux
alias tks='tmux kill-session -t'
alias tkw='tmux kill-window -t'
alias tkp='tmux kill-pane -t'
alias tls='tmux list-sessions -t'
alias tlw='tmux list-windows -t'
alias tlp='tmux list-panes -t'
alias xpanes='xpanes --log=$XDG_CACHE_HOME/xpanes-log'
alias xpc='xpanes -c'
alias xpd='xpanes -d -c'
alias xpe='xpanes -e'
alias xpssh='xpanes --ssh'

## others
alias v=nvim
alias -g ...='../..'
alias -g ....='../../..'
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
