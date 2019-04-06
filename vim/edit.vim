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

augroup GrepCmd
  autocmd!
  autocmd QuickFixCmdPost vim,grep,make if len(getqflist()) != 0 | cwindow | endif
augroup END

if executable('rg')
    let &grepprg = 'rg --vimgrep --hidden'
    set grepformat=%f:%l:%c:%m
endif

"" Encodings
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

"" persist undo
if has('persistent_undo')
  set undodir=./.vimundo,~/.vimundo
  augroup SaveUndoFile
    autocmd!
    autocmd BufReadPre ~/* setlocal undofile
  augroup END
endif

"" Jump to last cursor position when you open nvim
augroup KeepLastPosition
  autocmd BufRead * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
augroup END

"" Git commit spell check
augroup GitSpellCheck
  autocmd!
  autocmd FileType gitcommit setlocal spell
augroup END

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
set updatetime=50

function! s:auto_write_if_possible()
  if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
    write
  endif
endfunction

augroup auto_read_write
  autocmd!
  autocmd CursorHold  * call s:auto_write_if_possible()
  autocmd CursorHoldI * call s:auto_write_if_possible()
  autocmd CursorHold  * checktime
  autocmd CursorHoldI * checktime
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
