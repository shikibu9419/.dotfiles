"------------------------------------------
" Search & Replace
"------------------------------------------
set incsearch
set hls
set ignorecase
set smartcase
set wrapscan
set gdefault

"------------------------------------------
" Edit
"------------------------------------------
set updatetime=250
set whichwrap=b,s,h,l,<,>,[,]
set showcmd
set clipboard+=unnamed
set hidden
set virtualedit=block
set nobackup
set noswapfile
set autoread
set showmatch
set matchtime=1
set wildmenu
set history=1000
autocmd FileType * setlocal formatoptions-=ro
set backspace=indent,eol,start " Enable backspace (for Mac)

"" Encodings
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

"" Enable mouse setting
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a

"" Extend matchit
set matchpairs+=<:>
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

"" Auto write
set autowrite
function! s:AutoWriteIfPossible()
  if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
    write
  endif
endfunction
augroup autowrite
  autocmd!
  autocmd CursorHold * call s:AutoWriteIfPossible()
  autocmd CursorHoldI * call s:AutoWriteIfPossible()
augroup END

"" Reasign
augroup asign
  autocmd!
  autocmd BufWritePost *
        \ if &filetype ==# '' && exists('b:ftdetect') |
        \  unlet! b:ftdetect |
        \  filetype detect |
        \ endif
augroup END
