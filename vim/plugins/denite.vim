" autocmd FileType denite call s:denite_my_settings()
" function! s:denite_my_settings() abort
"   nnoremap <silent><buffer><expr> <CR>
"  \ denite#do_map('do_action')
"   nnoremap <silent><buffer><expr> d
"  \ denite#do_map('do_action', 'delete')
"   nnoremap <silent><buffer><expr> p
"  \ denite#do_map('do_action', 'preview')
"   nnoremap <silent><buffer><expr> q
"  \ denite#do_map('quit')
"   nnoremap <silent><buffer><expr> i
"  \ denite#do_map('open_filter_buffer')
"   nnoremap <silent><buffer><expr> <Space>
"  \ denite#do_map('toggle_select').'j'
" endfunction
" autocmd FileType denite-filter call s:denite_filter_my_setting()
" function! s:denite_filter_my_setting() abort
"   " 一つ上のディレクトリを開き直す
"   inoremap <silent><buffer><expr> <BS>    denite#do_map('move_up_path')
"   " Denite を閉じる
"   inoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
"   nnoremap <silent><buffer><expr> <C-c>   denite#do_map('quit')
" endfunction
" let s:denite_win_width_percent = 0.85
" let s:denite_win_height_percent = 0.7
"
" " Change denite default options
" call denite#custom#option('default', {
"    \ 'split': 'floating',
"    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
"    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
"    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
"    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
"    \ })
