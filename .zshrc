# OSごとの設定?
# pushd?
# (N-/)?

# 分割ファイル呼び出し
for file in ~/.zsh/[0-9]*.zsh
do
	source "$file"
done

# for rbenv
if [ -d ~/.rbenv ]
then
	export PATH=${PATH}:${HOME}/.rbenv/bin
	eval "$(rbenv init -)"
fi

# 補完機能
autoload -U compinit
compinit
setopt no_list_types		# ファイル識別マークの非表示
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select=2

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups	# 重複履歴の削除
# setopt hist_reduse_blanks

bindkey -v	# http://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9

# options
setopt auto_cd
setopt print_eight_bit
setopt no_beep
setopt extended_glob

# aliases
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -al'
alias lal='ls -al'
alias rm='rm -i'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
