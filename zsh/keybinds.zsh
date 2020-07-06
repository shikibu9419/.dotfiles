autoload -U history-search-end

zle -N __shikibu::ghq_jump_repository
zle -N __shikibu::show_ls_gs
zle -N __shikibu::select_history
zle -N __shikibu::tmuximum_wrapper
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -v
bindkey '^b' git-extended-checkout
bindkey '^e' autosuggest-accept
bindkey '^m' __shikibu::show_ls_gs
bindkey '^r' __shikibu::select_history
bindkey '^j' __shikibu::tmuximum_wrapper
bindkey '^P' history-beginning-search-backward-end
bindkey '^N' history-beginning-search-forward-end
bindkey '^]' __shikibu::ghq_jump_repository
