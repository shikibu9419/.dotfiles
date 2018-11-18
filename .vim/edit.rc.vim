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
  " C/C++, Java, Kotlin, CSS, JSON: 4 spaces
  autocmd BufRead,BufNewFile *.c    setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.cpp  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.java setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.kt   setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.css  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.json setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

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
" Enable backspace (for Mac)
set backspace=indent,eol,start
" Comment setting
autocmd FileType * setlocal formatoptions-=ro
" Completion setting
set completeopt+=noinsert

" Auto write
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

" Enable mouse setting
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a

" matchit
set matchpairs+=<:>
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" Reasign
augroup asign
  autocmd!
  autocmd BufWritePost *
        \ if &filetype ==# '' && exists('b:ftdetect') |
        \  unlet! b:ftdetect |
        \  filetype detect |
        \ endif
augroup END
