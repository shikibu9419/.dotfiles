let s:plug_repo_dir = '$XDG_CACHE_HOME/nvim/plugged'

call plug#begin(s:plug_repo_dir)
  "" completion
  Plug 'prabirshrestha/async.vim'
  Plug 'prabirshrestha/asyncomplete.vim'
  Plug 'prabirshrestha/asyncomplete-lsp.vim'
  Plug 'prabirshrestha/asyncomplete-buffer.vim'
  Plug 'prabirshrestha/asyncomplete-file.vim'
  Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
  Plug 'prabirshrestha/vim-lsp'
  "" NERDTree
  Plug 'scrooloose/nerdtree'
  Plug 'jistr/vim-nerdtree-tabs'
  "" Fuzzy Finder
"   Plug 'Shougo/denite.nvim'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  "" Terminal & Shell
  Plug 'kassio/neoterm'
  "" Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  "" Tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  "" Others
  Plug 'w0rp/ale'
  Plug 'osyo-manga/vim-over'
  Plug 'rhysd/clever-f.vim'
  Plug 'rhysd/accelerated-jk'
  Plug 'yonchu/accelerated-smooth-scroll'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'Shougo/vimproc.vim', {'do' : 'make'}
  Plug 'thinca/vim-quickrun'
  Plug 'tyru/open-browser.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'tyru/caw.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'junegunn/vim-easy-align'
  Plug 'cohama/lexima.vim'
  Plug 'rizzatti/dash.vim'
  "" Appearance
  Plug 'itchyny/lightline.vim'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'ryanoasis/vim-devicons'
  Plug 'Shougo/context_filetype.vim'
  Plug 'osyo-manga/vim-precious'
  "" colorschemes
  Plug 'flazz/vim-colorschemes'
  "" syntax highlights
  Plug 'sheerun/vim-polyglot'
  "" Snippets
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  "" ftplugins
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
  Plug 'plytophogy/vim-virtualenv',     { 'for': 'python' }
"   Plug 'PieterjanMontens/vim-pipenv',   { 'for': 'python' }
  Plug 'tpope/vim-rails',               { 'for': 'ruby' }
  Plug 'todesking/ruby_hl_lvar.vim',    { 'for': 'ruby' }
  Plug 'mechatroner/rainbow_csv',       { 'for': 'csv' }
  Plug 'editorconfig/editorconfig-vim'
call plug#end()

"" Load plugin config file
for conf in split(glob('$DOTPATH/vim/plugins/*.vim'),'\n')
  execute 'source' conf
endfor

"" Denite
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

"" Tmux navigator & neoterm
let g:tmux_navigator_no_mappings = 1
let g:neoterm_autoscroll = 1
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'belowright'

"" clever f
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1

"" smooth scroll
let g:ac_smooth_scroll_du_sleep_time_msec = 7
let g:ac_smooth_scroll_fb_sleep_time_msec = 7

"" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

let g:neosnippet#snippets_directory = '$DOTPATH/vim/snippets/, ' . s:plug_repo_dir . '/neosnippet-snippets/neosnippets/'

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

if !exists('g:context_filetype#filetypes')
  let g:context_filetype#filetypes = {}
endif


"     function! Multiple_cursors_before()
"       if exists(':NeoCompleteLock')==2
"         exe 'NeoCompleteLock'
"         echo 'Disabled Neocomplete'
"       endif
"     endfunction

set splitbelow
set splitright
let g:quickrun_no_default_key_mappings = 1
