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

" Enable backspace (for Mac)
set backspace=indent,eol,start
" Comment setting
autocmd FileType * setlocal formatoptions-=ro
" Completion setting
set completeopt+=noinsert
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

augroup asign
  autocmd!
  autocmd BufWritePost *
        \ if &filetype ==# '' && exists('b:ftdetect') |
        \  unlet! b:ftdetect |
        \  filetype detect |
        \ endif
augroup END
