# ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias lal='ls -al'

# color=auto
alias ls='gls --color=auto'
alias grep='grep --color=auto'

# git
git() { hub "$@" }

git-clone() {
  input=$1
  if [[ ${input#*/} = 'https:' ]]; then
    git clone $input
  else
    hub clone $input
  fi
}

remote-origin() {
  git remote add origin $(pbpaste)
}

alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gca='git commit --amend'
alias gcl=git-clone
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


# others
alias vim='nvim'
alias vi='nvim'
alias rm='rm -r'
alias cp='cp -r'
alias mkdir='mkdir -p'
alias ql='qlmanage -p $@ >& /dev/null'
alias reload='source ~/.zshenv && source ~/.zshrc'
