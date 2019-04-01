let g:lightline = {
\   'colorscheme': 'Hybrid',
\   'active': {
\     'left':[
\         [ 'mode', 'paste' ],
\         [ 'gitbranch', 'filename', 'readonly', 'modified' ],
\         [ 'ale' ]
\     ],
\     'right': [ [ 'lineinfo' ], [ 'percent' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
\   },
\   'component': { 'lineinfo': ' %3l:%-2v' },
\   'component_function': {
\     'gitbranch': 'fugitive#head',
\     'ale': 'ALEGetStatusLine',
\   },
\   'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
\   'subseparator': { 'left': "\ue0b1", 'right': "\ue0b3" },
\   'tabline': {
\     'left': [ ['tabs'] ],
\     'right': [ ['close'] ]
\   },
\ }

let g:lightline.tab = {
      \ 'active': [ 'tabnum', 'filename', 'modified' ],
      \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
      \ }

let g:lightline.tab_component_function = {
      \ 'filename': 'LightlineTabFilename',
      \ 'modified': 'lightline#tab#modified',
      \ 'readonly': 'lightline#tab#readonly',
      \ 'tabnum':   'lightline#tab#tabnum' }

"\     'filename': 'LightlineFilename',
" function! LightlineFilename()
"   let fname = expand('%:t')
"   return fname == '__Tagbar__' ? 'Tagbar' :
"       \ fname == 'ControlP' ? 'CtrlP' :
"       \ fname == '__Gundo__' ? 'Gundo' :
"       \ fname == '__Gundo_Preview__' ? 'Gundo Preview' :
"       \ fname =~ 'NERD_tree' ?  NERDTreeStatusline():
"       \ &ft == 'unite' ? 'Unite' :
"       \ &ft == 'vimfiler' ? 'VimFiler' :
"       \ &ft == 'vimshell' ? 'VimShell' :
"       \ winwidth(0) > 60 ? lightline#mode() : ''
" endfunction

function! LightlineTabFilename(n) abort
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  let _ = pathshorten(expand('#'.buflist[winnr - 1].':f'))
  return _ !=# '' ? _ : '[No Name]'
endfunction
