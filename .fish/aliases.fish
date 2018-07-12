#------------------------------------------
# aliases & abbrs
#------------------------------------------
balias reload 'source ~/.config/fish/config.fish'
balias ls     'gls --color'
balias grep   'grep --color'

# plugins
balias git  'hub'
balias cdg 'cd-gitroot'

function rm
  mv $argv ~/.Trash
end

# git
abbr g    'git'
abbr ga   'git add'
abbr gb   'git branch'
abbr gc   'git commit -m'
abbr gca  'git commit --amend'
abbr gcl  'git clone'
abbr gch  'git checkout'
abbr gd   'git diff'
abbr gl   'git log'
abbr gp   'git push'
abbr gpl  'git pull --rebase'
abbr grb  'git rebase'
abbr grs  'git reset'
abbr grm  'git remote'
abbr gs   'git status'
abbr gst  'git stash'
abbr gsta 'git stash apply'
abbr gsee 'git see'
abbr gpr  'git pull-request'

# others
# balias vim 'nvim'
# balias vi 'nvim'
# balias cp 'cp -r'
# balias mkdir 'mkdir -p'
# balias ql 'qlmanage -p $@ >& /dev/null'
