if [ -z $TMUX ]
  tmux; and exit
end

# TODO
# enhancd, tmuximum to fish?
# k() {
#   unfunction k
#   . ~/.zplug/repos/supercrabtree/k/k.sh
#
#   k "$@"
# }

source ~/.fish/env.fish
source ~/.fish/aliases.fish


#------------------------------------------
# appearances
#------------------------------------------
function fish_right_prompt
end

set fish_pager_color_completion yellow --bold


#------------------------------------------
# key bindings
#------------------------------------------
for mode in insert default visual
  fish_default_key_bindings -M $mode
end

fish_vi_key_bindings --no-erase

function fish_user_key_bindings
  bind \cr __peco_select_history
  bind \c] __ghq_project_search
end
