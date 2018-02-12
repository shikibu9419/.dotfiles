source /usr/local/opt/zplug/init.zsh

zplug "zsh-users/zsh-completions", lazy:true
zplug "b4b4r07/enhancd", use:init.sh
zplug "mollifier/cd-gitroot", as:command
zplug "b4b4r07/zsh-gomi", as:command

# if ! zplug check --verbose; then
#   printf "Install? [y/N]: "
#   if read -q; then
#     echo; zplug install
#   fi
# fi

zplug load --verbose
