#------------------------------------------
# CLI commands
#------------------------------------------
extract() {
  for f in $@; do
    case $f in
      *.zip)     unzip $f ;;
      *.tar.gz)  tar xvzf $f ;;
      *.tar.bz2) tar xvjf $f ;;
      *) echo "$f: skipped."
    esac
  done
  echo 'extract: done.'
}

paste_to() {
  echo -e -n "$(pbpaste)" >> $1
}


#------------------------------------------
# called from others
#------------------------------------------
__shikibu::check_git_availability() {
  git rev-parse > /dev/null 2>&1
}

__shikibu::show_ls_gs() {
  if [ -n "$BUFFER" ]; then
    zle accept-line
    return
  fi

  local color='\e[0;33m'
  local reset='\e[0m'

  echo
  echo -e "$color--- ls ---$reset"
  ls
  echo

  if __shikibu::check_git_availability; then
    echo -e "$color--- git status ---$reset"
    git status -sb
    echo
  fi
  echo

  zle reset-prompt
}

__shikibu::tmuximum_wrapper() {
  tmuximum
}

__shikibu::select_history() {
  local BUFFER=$(fc -l -n 1 | fzf --reverse --tac --query=$LBUFFER)
  CURSOR=$#BUFFER
}

__shikibu::list_projects() {
  projects="$(ghq list -p)\n$(ls -1d $DEVPATH/*)"

  # TODO: black list

  echo $projects
}

__shikibu::vscode_open_project() {
  local selected
  selected=$(__shikibu::list_projects | fzf)
  project=$(ghq root)/$selected

  [[ -z $selected ]] && return

  code $project
}

__shikibu::ghq_jump_repository() {
  local selected dir repo session current_session
  selected=$(__shikibu::list_projects | fzf --query=$LBUFFER)

  if [ -z $selected ]; then
    return
  elif [ -z $TMUX ]; then
    BUFFER="cd $selected"
    zle accept-line
    return
  fi

  repo=${selected##*/}
  if [[ ! $selected =~ ^'github.com'.+$ ]]; then
    local parent=${selected%/*}
    repo=${parent##*/}/$repo
  fi

  session=${repo//./-}
  current_session=$(tmux list-sessions | grep attached | cut -d":" -f1)

  if [[ $current_session = $session ]]; then
    BUFFER="cd $selected"
    zle accept-line
    return
  fi

  if [[ -n $(tmux list-sessions | grep $session) ]]; then
    tmux switch-client -t $session
    return
  fi

  if [[ $current_session =~ ^[0-9]+$ ]]; then
    BUFFER="cd $selected"
    zle accept-line
    tmux rename-session $session
  else
    tmux new-session -d -c $selected -s $session
    tmux switch-client -t $session
  fi
}
