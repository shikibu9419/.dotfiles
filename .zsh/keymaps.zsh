### Functions whose name starts with '_' are defined in dotfiles/.zsh/functions.zsh

# bindkeys
bindkey -v
zle -N _select_history
zle -N _ghq_list_repositories
zle -N _git_list_log
zle -N _git_list_checkout
zle -N _show_ls_gs

autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

autoload -U tetris; zle -N tetris
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '^e' autosuggest-accept
bindkey '^t' forward-word  # autosuggest-partial-accept
bindkey '^m' _show_ls_gs
bindkey '^r' _select_history
bindkey '^]' _ghq_list_repositories
bindkey '^b' _git_list_checkout

# Using with fzf
alias vls='vim $(git ls-files | fzf --reverse)'

# git
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

alias glog=_git_list_log
alias gwork=_git_list_worktree
alias gclone='git clone $(pbpaste)'
alias ghq-get='ghq get $(pbpaste)'
alias gpush='git push origin $(git branch | grep "*\ " | sed "s/.* //")'
alias gremote='git remote add origin $(pbpaste)'
alias gwa='git worktree add $(git rev-parse --show-cdup).git-worktrees/$1 -b $1'

# ls
alias la='ls -al'
alias ll='ls -l'

# color=auto
alias ls='gls --color=auto'
alias grep='grep --color=auto'

# others
alias -g ...='../..'
alias -g ....='../../..'
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias c='clear'
alias cp='cp -r'
alias mkdir='mkdir -p'
alias ql='qlmanage -p $@ >& /dev/null'
alias reload='source ~/.zshenv && source ~/.zshrc'
