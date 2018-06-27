"------------------------------------------
" View
"------------------------------------------
" Color
set t_Co=256
set background=dark
colorscheme hybrid

" encodings
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

set title
set number
set laststatus=2
set nrformats=
set scrolloff=3

" CursorLine Settings
set cursorline
hi LineNr ctermfg=243
hi CursorLineNr ctermfg=255

" Highlight ZenkakuSpace
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=darkgray
endfunction
if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme * call ZenkakuSpace()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
  augroup END
  call ZenkakuSpace()
endif


"------------------------------------------
" Indent
"------------------------------------------
set expandtab
set shiftround
set autoindent
set smartindent

set tabstop=2
set shiftwidth=2
set softtabstop=2

augroup filetypedetect
  " C/C++, Java, Kotlin, CSS/SCSS/SASS, JSON => 4 spaces
  autocmd BufRead,BufNewFile *.c    setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.cpp  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.java setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.kt   setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.css  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.scss setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.sass setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.json setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END
