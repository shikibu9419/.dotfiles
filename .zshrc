# OSごとの設定?
# pushd?

# 分割ファイル呼び出し
for file in ~/.zsh/[0-9]*.zsh
do
	    source "$file"
done

# 補完機能
autoload -U compinit
compinit
setopt no_list_types		# ファイル識別マークの非表示
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select=2

# 環境変数
export LANG=ja_JP.UTF-8
export EDITOR=vim

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt hist_ignore_dups		# 重複履歴の削除
# setopt hist_reduse_blanks

bindkey -v	# http://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9

# options
setopt auto_cd
setopt print_eight_bit
setopt no_beep
setopt extended_glob

# cdコマンド実行後、lsを実行する
# function cd() {
#   builtin cd $@ && ls;
# }

# alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
