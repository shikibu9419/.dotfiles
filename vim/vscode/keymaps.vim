nnoremap <silent> <Space>s :<C-u>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>
nnoremap <silent> <Space>f :<C-u>call VSCodeNotify('workbench.action.focusSideBar')<CR>
nnoremap <silent> <Space>/ :<C-u>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>')})<CR>
nnoremap <silent> <Space>d :<C-u>call VSCodeNotify('workbench.view.debug')<CR>
nnoremap <silent> <Space>o :<C-u>call VSCodeNotify('outline.focus')<CR>
nnoremap <silent> <Space>n :<C-u>call VSCodeNotify('workbench.view.explorer')<CR>
nnoremap <silent> <Space>e :<C-u>call VSCodeNotify('workbench.view.extensions')<CR>

" xmap gc  <Plug>VSCodeCommentary
" nmap gc  <Plug>VSCodeCommentary
" omap gc  <Plug>VSCodeCommentary
" nmap gcc <Plug>VSCodeCommentaryLine

