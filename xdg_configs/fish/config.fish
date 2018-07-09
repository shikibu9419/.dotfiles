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
# aliases & abbrs
#------------------------------------------
balias reload 'source ~/.config/fish/config.fish'
balias fishrc 'vim ~/.config/fish/config.fish; and reload'
balias ls     'gls --color'
balias grep   'grep --color'

# git
abbr git  'hub'
abbr g    'git'
abbr ga   'git add'
abbr gb   'git branch'
abbr gc   'git commit -m'
abbr gca  'git commit --amend'
abbr gcl  'git-clone'
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
