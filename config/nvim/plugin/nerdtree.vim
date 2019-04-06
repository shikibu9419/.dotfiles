let g:NERDTreeShowHidden = 1
let g:NERDTreeShowBookmarks = 1
"" NERDTree window is closed when other all buffers are closed
augroup NERDTreeSettings
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
if argc() == 0
  let g:nerdtree_tabs_open_on_console_startup=1
endif
