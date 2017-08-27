"------------------------------------------
" dein.vim set up
"------------------------------------------
" Skip initialization for vim-tiny or vim-small.
if 0 | endif

set nocompatible
filetype off

" <Leader>
let mapleader="\<Space>"

let s:dein_dir = $HOME . '/.vim/dein'
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
	call dein#begin(s:dein_dir)
	" TOML files
	let s:toml      = s:dein_dir . '/dein.toml'
	let s:lazy_toml = s:dein_dir . '/dein_lazy.toml'

	call dein#load_toml(s:toml, {'lazy': 0})
	call dein#load_toml(s:lazy_toml, {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif

" プラグインを自動インストール
if dein#check_install()
	call dein#install()
endif

filetype plugin indent on
syntax on


"------------------------------------------
" カラー設定
"------------------------------------------
set t_Co=256
set background=dark
colorscheme hybrid
" カーソルラインのハイライト
set cursorline
hi LineNr ctermfg=243
hi CursorLineNr ctermfg=255
" Vim の半透明化
augroup highlight
	autocmd!
	autocmd VimEnter,ColorScheme * highlight Normal ctermbg=NONE
	autocmd VimEnter,ColorScheme * highlight NonText ctermbg=NONE
	autocmd VimEnter,ColorScheme * highlight TablineSel ctermbg=NONE
	autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=NONE
	autocmd VimEnter,ColorScheme * highlight CursorLineNr ctermbg=NONE
augroup END


"------------------------------------------
" 表示設定
"------------------------------------------
" 編集中のファイル名を表示
set title
" 行番号の表示
set number
" 0 が前置されていても10進数と認識
set nrformats=
" 末尾から2行目にステータスラインを表示
set laststatus=2
" 上下3行の視界を確保
set scrolloff=3


"------------------------------------------
" 検索・置換え設定
"------------------------------------------
" インクリメンタルサーチを行う
set incsearch
" 検索にマッチした部分を強調表示
set hls
" 大文字/小文字の区別なく検索
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 置換時、g オプションをデフォルトに
set gdefault


"------------------------------------------
" インデント設定
"------------------------------------------
" タブ入力を複数の空白に置き換え
set expandtab
" Tab文字を半角スペース4つ分に設定
set tabstop=4
set softtabstop=4
" 改行時に前のインデントを継続
set autoindent
set smartindent
set shiftwidth=4


"------------------------------------------
" キーボード入力
"------------------------------------------
" [全モード] .vimrcを開く
noremap <Leader>. :tabedit $MYVIMRC<CR>
" [ノーマルモード] Yを行末までのヤンクに
nnoremap Y y$
" [ノーマルモード] 数字のインクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
" [インサートモード] jjと入力するとコマンドモードに
inoremap jj <Esc>:
" [コマンドモード] <C-p>/<C-n> で履歴を遡る
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


"------------------------------------------
" その他
"------------------------------------------
" マウス入力を有効に
set mouse=a
set ttymouse=xterm2
" backspaceを有効に
set backspace=indent,eol,start
" クリップボード設定
set clipboard+=unnamed
" バッファを削除しない
set hidden
" ヴィジュアル短形で行末以降も選択可能
set virtualedit=block
" バックアップ・スワップファイルを作らない
set nobackup
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" 入力した括弧に対応する括弧にカーソルが飛ぶ(0.1秒間)
set showmatch
set matchtime=1
" 改行時コメント継続を防ぐ
autocmd FileType * setlocal formatoptions-=ro
" コマンドモードの補完
set wildmenu
" コマンドパターンを1000個まで履歴に残す
set history=1000


"------------------------------------------
" タブ設定 (http://qiita.com/wadako111/items/755e753677dd72d8036d)
"------------------------------------------
" Anywhere SID.
function! s:SID_PREFIX()
	return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
	let s = ''
	for i in range(1, tabpagenr('$'))
		let bufnrs = tabpagebuflist(i)
		let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
		let no = i  " display 0-origin tabpagenr.
		let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
		let title = fnamemodify(bufname(bufnr), ':t')
		let title = '[' . title . ']'
		let s .= '%'.i.'T'
		let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
		let s .= no . ':' . title
		let s .= mod
		let s .= '%#TabLineFill# '
	endfor
	let s .= '%#TabLineFill#%T%=%#TabLine#'
	return s
endfunction

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

" Tab jump (<Tab>n で左からn番目のタブにジャンプ)
for n in range(1, 9)
	execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" 新しいタブを一番右に作る
map <silent> <Tab>c :tablast <bar> tabnew<CR>
" タブを閉じる
map <silent> <Tab>x :tabclose<CR>
" 次のタブ
map <silent> <Tab>n :tabnext<CR>
" 前のタブ
map <silent> <Tab>p :tabprevious<CR>


"------------------------------------------
" ファイルタイプごとの設定
"------------------------------------------
augroup filetypedetect
	" Ruby
	autocmd BufRead,BufNewFile *.rb setlocal tabstop=2 shiftwidth=2 softtabstop=2
	" TeX
	autocmd BufNewfile *.tex 0r $HOME/.vim/templates/tex.txt
	" Gnuplot
	autocmd BufNewfile *.gpi 0r $HOME/.vim/templates/gnuplot.txt
augroup END
