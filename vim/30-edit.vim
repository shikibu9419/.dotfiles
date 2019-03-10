set whichwrap=b,s,h,l,<,>,[,]
set showcmd
set clipboard+=unnamed
set hidden
set virtualedit=block
set nobackup
set noswapfile
set showmatch
set matchtime=1
set wildmenu
set history=1000
autocmd FileType * setlocal formatoptions-=ro
set backspace=indent,eol,start " Enable backspace (for Mac)

"" Search & Replace
set incsearch
set hls
set ignorecase
set smartcase
set wrapscan
set gdefault
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

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

"" Auto read / write
set autowrite
set autoread
set ttimeoutlen=50
set updatetime=250

function! s:auto_write_if_possible()
  if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
    write
  endif
endfunction

augroup autoreadwrite
  autocmd!
  autocmd CursorHold  * call s:auto_write_if_possible()
  autocmd CursorHoldI * call s:auto_write_if_possible()
  autocmd FocusGained * checktime
augroup END

"" Reassign
augroup assign
  autocmd!
  autocmd BufWritePost *
        \ if &filetype ==# '' && exists('b:ftdetect') |
        \  unlet! b:ftdetect |
        \  filetype detect |
        \ endif
augroup END
