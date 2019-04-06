""" inspired: delphinus/lightline-delphinus

let s:ale_linting_glyph = "\uf250 " " 
let s:help_glyph = "\uf128 " " 
let s:ro_glyph = "\ue0a2 " " 
let s:separator = { 'left': "\ue0b0", 'right': "\ue0b2 " }
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
      \   'gitbranch':    'fugitive#head',
      \   'filename':     'LightlineFilename',
      \   'readonly':     'LightlineReadonly',
      \   'fileformat':   'LightlineFileformat',
      \   'fileencoding': 'LightlineFileencoding',
      \   'filetype':     'LightlineFiletype',
      \ },
      \ 'tab': {
      \   'active': [ 'tabnum', 'filename', 'modified' ],
      \   'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ },
      \ 'tabline': {
      \   'left': [['tabs']],
      \   'right': [['close']]
      \ },
      \ 'tab_component_function': {
      \   'filename': 'LightlineTabFilename',
      \   'modified': 'lightline#tab#modified',
      \   'readonly': 'lightline#tab#readonly',
      \   'tabnum':   'lightline#tab#tabnum'
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
      \}

"" Lightline functions
function! LightlineFilename() abort
  return (&buftype ==# 'terminal' ? has('nvim') ? b:term_title . ' (' . b:terminal_job_pid . ')' : '' :
       \ &filetype ==# 'vimfiler' ? vimfiler#get_status_string() :
       \ &filetype ==# 'unite' ? unite#get_status_string() :
       \ &filetype ==# 'denite' ? denite#get_status_sources() :
       \ &filetype ==# 'fzf' ? get(g:lightline, 'fname', '') :
       \ &filetype ==# 'tagbar' ? get(g:lightline, 'fname', '') :
       \ '' !=# expand('%:t') ? expand('%:t') : '[No Name]')
endfunction

function! LightlineReadonly() abort
  return &buftype ==# 'terminal' ? '' :
        \ &filetype ==# 'help' ? s:help_glyph :
        \ &filetype !~# 'vimfiler\|gundo\|fzf\|tagbar' && &readonly ? s:ro_glyph :
        \ &modifiable ? '' : '-'
endfunction

function! LightlineFileformat() abort
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|fzf' ? '' :
        \ winwidth(0) > 120 ? &fileformat . (exists('*WebDevIconsGetFileFormatSymbol') ? ' ' . WebDevIconsGetFileFormatSymbol() : '') : ''
endfunction

function! LightlineFiletype() abort
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|fzf' ? '' :
        \ winwidth(0) > 120 ? (strlen(&filetype) ? &filetype . (exists('*WebDevIconsGetFileTypeSymbol') ? ' ' . WebDevIconsGetFileTypeSymbol() : '') : 'no ft') : ''
endfunction

function! LightlineFileencoding() abort
  return &buftype ==# 'terminal' || &filetype =~# 'denite\|fzf' ? '' :
        \ winwidth(0) > 120 ? (strlen(&fileencoding) ? &fileencoding : &encoding) : ''
endfunction

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction

function! LightlineAleError() abort
  return s:ale_error
endfunction

function! LightlineAleWarning() abort
  return s:ale_warning
endfunction


"" ale
function! s:update_pre_lint()
  call s:reset_lint()
  let s:ale_warning = s:ale_linting_glyph
  call lightline#update()
endfunction

function! s:update_post_lint()
  call s:reset_lint()
  let counts = ale#statusline#Count(bufnr('%'))
  let [error_format, warning_format, no_errors] = g:ale_statusline_format

  let errors = counts.error + counts.style_error
  let s:ale_error = errors ? printf(error_format, errors) : ''

  let warnings = counts.warning + counts.style_warning
  let s:ale_warning = warnings ? printf(warning_format, warnings) : ''

  call lightline#update()
endfunction

function! s:reset_lint()
  let s:ale_error = ''
  let s:ale_warning = ''
  let s:ale_ok = ''
  call lightline#update()
endfunction

augroup LightLineALE
  autocmd!
  autocmd User ALELint     call s:reset_lint()
  autocmd User ALELintPre  call s:update_pre_lint()
  autocmd User ALELintPost call s:update_post_lint()
  autocmd User ALEFixPre   call s:update_pre_lint()
  autocmd User ALEFixPost  call s:update_post_lint()
augroup end
