autoload -Uz colors
colors

SPROMPT="%{$fg[red]%}correct: %R -> %r [nyae]? %{$reset_color%}"

# pure setting
# autoload -U promptinit; promptinit
# prompt pure

#------------------------------------------
# Prompt
#------------------------------------------
ZSH_THEME_GIT_PROMPT_PREFIX=" \ue0a0 "
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=" ✘"
ZSH_THEME_GIT_PROMPT_CLEAN=" ✔"

ZSH_THEME_GIT_PROMPT_ADDED=" %F{green}✚%F{black}"
ZSH_THEME_GIT_PROMPT_MODIFIED=" %F{blue}✹%F{black}"
ZSH_THEME_GIT_PROMPT_DELETED=" %F{red}✖%F{black}"
ZSH_THEME_GIT_PROMPT_UNTRACKED=" %F{yellow}✭%F{black}"
ZSH_THEME_GIT_PROMPT_RENAMED=" ➜"
ZSH_THEME_GIT_PROMPT_UNMERGED=" ═"
ZSH_THEME_GIT_PROMPT_AHEAD=" ⬆"
ZSH_THEME_GIT_PROMPT_BEHIND=" ⬇"
ZSH_THEME_GIT_PROMPT_DIVERGED=" ⬍"

if [ $(id -u) -eq 0 ]; then
  # root color
  user_fg_color="black"
  user_bg_color="green"
else
  # other user color
  user_fg_color="black"
  user_bg_color="blue"
fi

git_fg_color="black"
git_bg_color="white"

# if [ "$VIRTUAL_ENV" != "" ] && [ "$POWERLINE_HIDE_VIRTUAL_ENV" = "" ]; then
#   VENV_NAME=$(basename "$VIRTUAL_ENV")
#   VENV_STATUS=" %F{black}($VENV_NAME)%f"
# fi

autoload -Uz add-zsh-hook
add-zsh-hook precmd _update_info

user_info="%F{$user_fg_color}%K{$user_bg_color}$VENV_STATUS %(5~,%-1~/.../%2~,%~) %F{$user_bg_color}%K{$git_bg_color}"

_update_info() {
  git_info="%F{$git_fg_color}%K{$git_bg_color}$(git_prompt_info)$(git_prompt_status) %F{$git_bg_color}%k"
  PROMPT="$user_info"$'\ue0b0'"$git_info"$'\ue0b0'"%f%k "
}

# LS_COLORS
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS="rs=0:di=01;34:ln=36:mh=00:pi=40;33:so=35:do=35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:*.tar=31:*.tgz=31:*.arj=31:*.taz=31:*.lzh=31:*.lzma=31:*.tlz=31:*.txz=31:*.zip=31:*.z=31:*.Z=31:*.dz=31:*.gz=31:*.lz=31:*.xz=31:*.bz2=31:*.bz=31:*.tbz=31:*.tbz2=31:*.tz=31:*.deb=31:*.rpm=31:*.jar=31:*.war=31:*.ear=31:*.sar=31:*.rar=31:*.ace=31:*.zoo=31:*.cpio=31:*.7z=31:*.rz=31:*.jpg=35:*.jpeg=35:*.gif=35:*.bmp=35:*.pbm=35:*.pgm=35:*.ppm=35:*.tga=35:*.xbm=35:*.xpm=35:*.tif=35:*.tiff=35:*.png=35:*.svg=35:*.svgz=35:*.mng=35:*.pcx=35:*.mov=35:*.mpg=35:*.mpeg=35:*.m2v=35:*.mkv=35:*.webm=35:*.ogm=35:*.mp4=35:*.m4v=35:*.mp4v=35:*.vob=35:*.qt=35:*.nuv=35:*.wmv=35:*.asf=35:*.rm=35:*.rmvb=35:*.flc=35:*.avi=35:*.fli=35:*.flv=35:*.gl=35:*.dl=35:*.xcf=35:*.xwd=35:*.yuv=35:*.cgm=35:*.emf=35:*.axv=35:*.anx=35:*.ogv=35:*.ogx=35:*.aac=36:*.au=36:*.flac=36:*.mid=36:*.midi=36:*.mka=36:*.mp3=36:*.mpc=36:*.ogg=36:*.ra=36:*.wav=36:*.axa=36:*.oga=36:*.spx=36:*.xspf=36:*.eps=35:ex=32:"
