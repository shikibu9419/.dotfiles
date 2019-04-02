let s:mo_glyph = "\uf040 " " 
let s:help_glyph = "\uf128 " " 
let s:ale_linting_glyph = "\uf250 " " 
let s:ro_glyph = "\ue0a2 " " 
let s:branch_glyph = "\ue0a0 " " 
let s:separator = { 'left': "\ue0b0", 'right': "\ue0b2" }
let s:subseparator = { 'left': "\ue0b1", 'right': "\ue0b3 " }

let s:ale_warning = ''
let s:ale_error = ''

let g:lightline = {
\ 'colorscheme': 'material',
\ 'active': {
\   'left':[
\       [ 'mode', 'paste' ],
\       [ 'gitbranch', 'filename', 'readonly' ],
\       [ 'status_errors', 'status_warnings' ]
\   ],
\   'right': [[ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ]]
\ },
\ 'inactive': {
\   'left':  [['filename']],
\   'right': [['lineinfo'], ['percent']]
\ },
\ 'component': { 'lineinfo': ' %3l:%-2v' },
\ 'component_function': {
\   'fileformat': 'LightlineFileformat',
\   'fileencoding': 'LightlineFileencoding',
\   'filetype': 'LightlineFiletype',
\   'gitbranch': 'fugitive#head',
\   'ale': 'ALEGetStatusLine',
\ },
\ 'component_expand': {
\   'status_errors':   'LightlineAleError',
\   'status_warnings': 'LightlineAleWarning',
\ },
\ 'component_type': {
\   'status_errors':   'error',
\   'status_warnings': 'warning',
\ },
\ 'separator': s:separator,
\ 'subseparator': s:subseparator,
\ 'tabline': {
\   'left': [['tabs']],
\   'right': [['close']]
\ },
\}

let g:lightline.tab = {
    \ 'active': [ 'tabnum', 'filename', 'modified' ],
    \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
    \ }

let g:lightline.tab_component_function = {
    \ 'filename': 'LightlineTabFilename',
    \ 'modified': 'lightline#tab#modified',
    \ 'readonly': 'lightline#tab#readonly',
    \ 'tabnum':   'lightline#tab#tabnum' }

function! LightlineFileformat() abort
"   return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
       return winwidth(0) > 120 ? &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : '') : ''
endfunction

function! LightlineFiletype() abort
"   return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
       return winwidth(0) > 120 ? (strlen(&filetype) ? &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : '') : 'no ft') : ''
endfunction

function! LightlineFileencoding() abort
"   return &buftype ==# 'terminal' || &filetype =~# 'denite\|tagbar' ? '' :
       return winwidth(0) > 120 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction
