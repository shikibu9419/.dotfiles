## Original functions are defined in DOTPATH/zsh/60-functions.zsh

autoload -Uz zmv
autoload -U history-search-end
autoload -U tetris; zle -N tetris

zle -N git_list_branch
zle -N _show_ls_gs
zle -N select_history
zle -N ghq_jump_repository
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -v
bindkey '^b' git_list_branch
bindkey '^m' _show_ls_gs
bindkey '^r' select_history
bindkey '^]' ghq_jump_repository
bindkey '^e' autosuggest-accept
bindkey '^t' forward-word  # autosuggest-partial-accept
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
