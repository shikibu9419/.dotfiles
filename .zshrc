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
fpath=(path/to/zsh-completions/src $fpath)
zstyle ':completion:*' list-colors "${LS_COLORS}"
zstyle ':completion:*' menu select=2
setopt no_list_types		# ファイル識別マークの非表示
setopt print_eight_bit  	# 日本語ファイル名などの8ビットを通す
setopt globdots 			# から始まるファイルをマッチ
setopt extended_glob		# 拡張グロブで補完

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt hist_ignore_dups		# 重複履歴の削除
# setopt hist_reduse_blanks

bindkey -v	# http://qiita.com/b4b4r07/items/8db0257d2e6f6b19ecb9

# options
setopt auto_cd
setopt no_beep

chpwd() { ls }
