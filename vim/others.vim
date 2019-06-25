"" Indent
set expandtab
set shiftround
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2

"" Tab setting
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

"" Setting per filetype
augroup filetypedetect
  autocmd BufRead,BufNewFile *.slim setlocal filetype=slim
  autocmd BufRead,BufNewFile *.c    setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.cpp  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.java setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.jl   setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.py   setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.kt   setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.css  setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd BufRead,BufNewFile *.json setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

set secure
