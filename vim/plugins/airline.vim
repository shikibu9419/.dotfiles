nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
set ttimeoutlen=50

let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#virtualenv#enabled = 1

"" Tab
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
map <silent> <Tab>c :tablast <bar> tabnew<CR>
for index in range(1, 9)
  execute 'nnoremap <silent> <Tab>'.index  ':<C-u>tabnext'.index.'<CR>'
endfor

"" Ale
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#ale#error_symbol = 'E:'
" let g:airline#extensions#ale#warning_symbol = 'W:'
