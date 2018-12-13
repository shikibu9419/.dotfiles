### Functions whose name starts with '_' are defined in DOTPATH/zsh/functions.zsh

## plugins
alias t=tmuximum
alias cdg=cd-gitroot

## git
alias git='hub'
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gcadd='git commit -am'
alias gcl='git clone'
alias gch='git checkout'
alias gd='git diff'
alias gl='git log'
alias gp='git push'
alias gpl='git pull --rebase'
alias grb='git rebase'
alias grs='git reset'
alias grm='git remote'
alias gs='git status'
alias gst='git stash'
alias gsta='git stash apply'
alias gw='git worktree'
alias gcom='hub compare'
alias gpr='hub pull-request'
alias gsee='hub see'

alias glog=git_list_log
alias gwork=git_list_worktree
alias gclone='git clone $(pbpaste)'
alias ghq-get='ghq get $(pbpaste)'
alias gpush='git push origin $(git branch | grep "*\ " | sed "s/.* //")'
alias gpushf='git push -f origin $(git branch | grep "*\ " | sed "s/.* //")'
alias grmadd='git remote add origin $(pbpaste)'
alias gwa='git worktree add $(git rev-parse --show-cdup).git-worktrees/$1 -b $1'
alias remind='git remind status'
alias fpd='git diff --stat | fpp'
alias fps='git status | fpp'

## tmux
alias tks='tmux kill-session -t'
alias tkw='tmux kill-window -t'
alias tkp='tmux kill-pane -t'
alias tls='tmux list-sessions -t'
alias tlw='tmux list-windows -t'
alias tlp='tmux list-panes -t'

## abbr
alias ls='gls --color=auto'
alias grep='grep --color=auto'
alias la='ls -al'
alias ll='ls -l'
alias cp='cp -r'
alias mkdir='mkdir -p'
alias zmv='noglob zmv -W'

## others
alias reload='source ~/.zshenv && source ~/.zshrc'
alias editenv='nvim $DOTPATH && echo "Reloading..."; reload'
alias -g ...='../..'
alias -g ....='../../..'
alias v=nvim
alias vi=nvim
alias vim=nvim
alias c=clear
