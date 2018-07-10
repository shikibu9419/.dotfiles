if [ -z $TMUX ]
  tmux; and exit
end

# TODO
# pip completion
# emoji?, enhancd, k?, tmuximum to fish?
# k() {
#   unfunction k
#   . ~/.zplug/repos/supercrabtree/k/k.sh
#
#   k "$@"
# }

source ~/.config/fish/env.fish

function fish_right_prompt
end

function fish_user_key_bindings
  # bind \cr __peco_select_history
  bind \c] __ghq_project_search
end

# function add_history
#   さっきのコマンドが5文字未満 or コマンドがexitじゃなかったらdelete?
# end

# key bindings
for mode in insert default visual
  fish_default_key_bindings -M $mode
end

fish_vi_key_bindings --no-erase

set fish_pager_color_completion green --bold


#------------------------------------------
# aliases & abbrs
#------------------------------------------
balias reload 'source ~/.config/fish/config.fish'
balias fishrc 'vim ~/.config/fish/config.fish; and reload'
balias ls     'gls --color'
balias grep   'grep --color'
balias git  'hub'

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
# balias rm 'rm -r'
# balias cp 'cp -r'
# balias mkdir 'mkdir -p'
# balias ql 'qlmanage -p $@ >& /dev/null'
