# bindkeys
bindkey -v	# http://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward
bindkey '^e' autosuggest-accept
bindkey '^t' forward-word  # autosuggest-partial-accept
bindkey '^r' __select_history
bindkey '^]' __ghq_list_projects

# plugins
alias cdg=cd-gitroot
alias t='tmuximum'

# git
remote-origin() {
  git remote add origin $(pbpaste)
}

alias git='hub'
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit --amend'
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
alias gsee='git see'
alias gpr='git pull-request'

# ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias lal='ls -al'

# color=auto
alias ls='gls --color=auto'
alias grep='grep --color=auto'

# others
alias vim='nvim'
alias cp='cp -r'
alias mkdir='mkdir -p'
alias ql='qlmanage -p $@ >& /dev/null'
alias reload='source ~/.zshenv && source ~/.zshrc'
