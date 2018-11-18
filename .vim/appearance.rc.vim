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
