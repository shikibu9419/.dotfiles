"------------------------------------------
" NeoBundle set up
"------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
	set nocompatible               " Be iMproved
	set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'lervag/vimtex'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'nathanaelkane/vim-indent-guides'

" COLORSCHEMES
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'jonathanfilip/vim-lucius'

call neobundle#end()

filetype plugin indent on
filetype indent on
syntax on

NeoBundleCheck


"------------------------------------------
" カラー設定
"------------------------------------------
set t_Co=256
colorscheme lucius
set background=dark

set cursorline
hi LineNr ctermfg=243
hi CursorLineNr ctermfg=255

augroup highlight
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
" 0が前置されていても10進数と認識(デフォルトは8進数)
set nrformats=
" 末尾から2行目にステータスラインを表示
set laststatus=2


"------------------------------------------
"検索・置換え設定
"------------------------------------------
" 検索にマッチした部分を強調表示
set hls
" 大文字/小文字の区別なく検索
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan


"------------------------------------------
"インデント設定
"------------------------------------------
" Tab文字の可視化
set list listchars=tab:\▸\ 
" Tab文字を半角スペース4つ分に設定
set tabstop=4
" 改行時に前のインデントを継続
set autoindent
set shiftwidth=4


"------------------------------------------
"キーボード入力
"------------------------------------------
" [ノーマルモード] 常に表示行単位の移動に
nnoremap j gj
nnoremap k gk
" [ノーマルモード] Yを行末までのヤンクに
nnoremap Y y$
" [ノーマルモード] 数字のインクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
" [ノーマルモード] Enter で改行
nnoremap <CR> o<Esc>
" [インサートモード] jjと入力するとコマンドモードに
inoremap jj <Esc>:
" [コマンドモード] <C-p>/<C-n> で履歴を遡れる
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


"------------------------------------------
" その他
"------------------------------------------
"マウス設定
set mouse=i
set ttymouse=xterm2
" 改行時コメント継続を防ぐ
autocmd FileType * setlocal formatoptions-=ro
" 複数ファイルを編集
set hidden
" ヴィジュアル短形で行末以降も選択可能
set virtualedit=block
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" 入力した括弧に対応する括弧にカーソルが飛ぶ(0.1秒間)
set showmatch
set matchtime=1
" コマンドパターンを100個まで履歴に残す
set history=100


"------------------------------------------
" タブ設定(http://qiita.com/wadako111/items/755e753677dd72d8036d)
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
set showtabline=2 " 常にタブラインを表示

" The prefix key.
nnoremap [Tag] <Nop>
nmap t [Tag]
" Tab jump (t1 で1番左のタブ、t2 で1番左から2番目のタブにジャンプ)
for n in range(1, 9)
	execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" tc: 新しいタブを一番右に作る
map <silent> [Tag]c :tablast <bar> tabnew<CR>
" tx: タブを閉じる
map <silent> [Tag]x :tabclose<CR>
" tn: 次のタブ
map <silent> [Tag]n :tabnext<CR>
" tp: 前のタブ
map <silent> [Tag]p :tabprevious<CR>


"------------------------------------------
" ファイルタイプごとの設定
"------------------------------------------
augroup filetypedetect
	" C
	autocmd BufRead,BufNewFile *.c setlocal tabstop=4 shiftwidth=4
	" C++
	autocmd BufRead,BufNewFile *.cpp setlocal tabstop=4 shiftwidth=4
	" TeX
	autocmd BufRead,BufNewFile *.tex setlocal tabstop=2 shiftwidth=2
	autocmd BufNewfile *.tex 0r $HOME/.vim/templates/tex.txt
	" Ruby
	autocmd BufRead,BufNewFile *.rb setlocal tabstop=2 shiftwidth=2
augroup END
