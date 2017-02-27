"------------------------------------------
"プラグインセットアップ
"------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

filetype off

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))


" QuickRun
NeoBundle 'thinca/vim-quickrun'
" gc でコメントON/OFF
NeoBundle 'tomtom/tcomment_vim'
" :NERDTree でファイルのtree表示
NeoBundle 'scrooloose/nerdtree'
" [Ruby etc.] endの自動挿入
NeoBundle 'tpope/vim-endwise'
" for LaTeX
NeoBundle 'lervag/vimtex'

" COLORSCHEMES
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" hybrid
NeoBundle 'w0ng/vim-hybrid'
" lucius
NeoBundle 'jonathanfilip/vim-lucius'


call neobundle#end()

filetype plugin indent on
filetype indent on
syntax on

NeoBundleCheck


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
" 編集行、番号のハイライト
"set t_Co=256
set cursorline
hi clear CursorLine
colorscheme jellybeans


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


" ファイルタイプごとの設定
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

augroup highlight
	autocmd VimEnter * highlight Normal ctermbg=NONE
	autocmd VimEnter * highlight NonText ctermbg=NONE
	autocmd VimEnter * highlight TablineSel ctermbg=NONE
	autocmd VimEnter * highlight LineNr ctermbg=NONE
	autocmd VimEnter * highlight CursorLineNr ctermbg=NONE
augroup END
