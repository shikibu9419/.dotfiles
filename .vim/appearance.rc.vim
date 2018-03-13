"------------------------------------------
" View
"------------------------------------------
" Color
set t_Co=256
set background=dark
colorscheme afterglow

" 文字コード
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

" 編集中のファイル名を表示
set title
" 行番号の表示
set number
" 末尾から2行目にステータスラインを表示
set laststatus=2
" 0 が前置されていても10進数と認識
set nrformats=
" 上下3行の視界を確保
set scrolloff=3

" カーソルラインのハイライト
set cursorline
hi LineNr ctermfg=243
hi CursorLineNr ctermfg=255


"------------------------------------------
" Indent
"------------------------------------------
" タブ入力を複数の空白に置き換え
set expandtab
" Tab文字を半角スペース2つ分に設定
set tabstop=2
set shiftwidth=2
set softtabstop=2
" 改行時に前のインデントを継続
set autoindent
set smartindent

augroup filetypedetect
  " C/C++, Java, Kotlin, CSS/SCSS
  autocmd BufRead,BufNewFile *.c    setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.cpp  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.java setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.kt   setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.css  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.scss setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END
