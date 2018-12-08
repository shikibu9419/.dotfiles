### My fish environment is uncompleted...

if [[ -z $TMUX ]]
  if [[ -n $(tmux list-sessions) ]]
    cmd=tmuximum
  else
    cmd='tmux new-session'
  fi
  $cmd; and exit
fi

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
# Appearances
#------------------------------------------
function fish_right_prompt
end

set fish_pager_color_completion yellow --bold

#------------------------------------------
# Key bindings
#------------------------------------------
for mode in insert default visual
  fish_default_key_bindings -M $mode
end

fish_vi_key_bindings --no-erase

function fish_user_key_bindings
end
