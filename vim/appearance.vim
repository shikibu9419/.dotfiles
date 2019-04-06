set title
set number
set laststatus=2
set nrformats=
set scrolloff=3
set ambiwidth=double

"" Color & Highlight
set t_Co=256
set background=dark
set cursorline
hi LineNr ctermfg=243
hi CursorLineNr ctermfg=255
colorscheme hybrid_material

"" True color
if has('nvim')
  let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

if !has('gui_running') && exists('&termguicolors') && $COLORTERM ==# 'truecolor'
  if !has('nvim')
    let &t_8f = "\e[38;2;%lu;%lu;%lum"
    let &t_8b = "\e[48;2;%lu;%lu;%lum"
  endif
  set termguicolors
endif

"" Highlight multi bite space
function! s:multi_bite_space()
  highlight multi_bite_space cterm=underline ctermfg=lightblue guibg=darkgray
endfunction

if has('syntax')
  augroup multi_bite_space
    autocmd!
    autocmd ColorScheme * call s:multi_bite_space()
    autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('multi_bite_space', '　')
  augroup END
  call s:multi_bite_space()
endif
