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
source ~/.fish/keymaps.fish

# function _remember_command -e fish_postexec
#   echo $argv > ~/.fish/.cache/previous_command
# end
#
# function _history_sort -e fish_prompt
#   set -l prev (cat ~/.fish/.cache/previous_command | string trim)
#   set -l len (string length $prev)
#   if [ $len -le 4 ]
#     history delete --exact $prev
#   end
# end

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
  bind \cr _peco_select_history
  bind \c] _ghq_project_search
end
