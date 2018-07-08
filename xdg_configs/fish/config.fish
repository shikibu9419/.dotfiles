if [ -z $TMUX ]
  tmux; and exit
end

source ~/.config/fish/env.fish

function fish_user_key_bindings
  bind \cr __peco_select_history
  bind \c] __peco_ghq
end

for mode in insert default visual
  fish_default_key_bindings -M $mode
end

fish_vi_key_bindings --no-erase


# set fish_pager_color_completion --bold
# set fish_pager_color_secondary

# set bg_color = secondary ? highlight_spec_pager_secondary : highlight_spec_normal
set -g theme_display_user yes
# set -g theme_hostname never
# set -g theme_hostname always
set -g default_user your_normal_user


#------------------------------------------
# aliases
#------------------------------------------
balias reload 'source ~/.config/fish/config.fish'
balias fishrc 'vim ~/.config/fish/config.fish; and reload'
balias ls     'gls --color'
balias grep   'grep --color'

# git
balias git  'hub'
balias g    'git'
balias ga   'git add'
balias gb   'git branch'
balias gc   'git commit -m'
balias gca  'git commit --amend'
balias gcl  'git-clone'
balias gch  'git checkout'
balias gd   'git diff'
balias gl   'git log'
balias gp   'git push'
balias gpl  'git pull --rebase'
balias grb  'git rebase'
balias grs  'git reset'
balias grm  'git remote'
balias gs   'git status'
balias gst  'git stash'
balias gsta 'git stash apply'
balias gsee 'git see'
balias gpr  'git pull-request'

# others
# balias vim 'nvim'
# balias vi 'nvim'
# balias rm 'rm -r'
# balias cp 'cp -r'
# balias mkdir 'mkdir -p'
# balias ql 'qlmanage -p $@ >& /dev/null'
