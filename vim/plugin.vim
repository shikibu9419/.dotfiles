call plug#begin('$XDG_CACHE_HOME/nvim/plugged')
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
  "" Terminal & Shell
  Plug 'kassio/neoterm'
  "" Git
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  "" Tmux
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  "" Enhancement
  Plug 'w0rp/ale'
  Plug 'osyo-manga/vim-over'
  Plug 'rhysd/clever-f.vim'
  Plug 'rhysd/accelerated-jk'
  Plug 'yonchu/accelerated-smooth-scroll'
  Plug 'Shougo/vimproc.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'thinca/vim-quickrun'
  Plug 'tyru/open-browser.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'tyru/caw.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'junegunn/vim-easy-align'
  "" Appearance
  Plug 'itchyny/lightline.vim'
  Plug 'Shougo/context_filetype.vim'
  Plug 'osyo-manga/vim-precious'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'mechatroner/rainbow_csv', { 'for': 'csv' }
  Plug 'ryanoasis/vim-devicons'
  "" colorschemes
  Plug 'flazz/vim-colorschemes'
  "" syntax highlights
  Plug 'sheerun/vim-polyglot'
  "" External plugins
  Plug 'rizzatti/dash.vim'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'cohama/lexima.vim'
  "" Snippets
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  "" Python
  Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
  "" Rails
  Plug 'tpope/vim-rails', { 'for': 'ruby' }
  Plug 'todesking/ruby_hl_lvar.vim', { 'for': 'ruby' }
call plug#end()

let g:neoterm_autoscroll = 1
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'belowright'

let g:tmux_navigator_no_mappings = 1

let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1

"     function! Multiple_cursors_before()
"       if exists(':NeoCompleteLock')==2
"         exe 'NeoCompleteLock'
"         echo 'Disabled Neocomplete'
"       endif
"     endfunction

let g:ac_smooth_scroll_du_sleep_time_msec = 7
let g:ac_smooth_scroll_fb_sleep_time_msec = 7
set splitbelow
set splitright
let g:quickrun_no_default_key_mappings = 1
"   let g:quickrun_config = {
"      \ '_' : {
"          \ 'runner' : 'vimproc',
"          \ 'runner/vimproc/updatetime' : 40,
"          \ 'outputter' : 'error',
"          \ 'outputter/error/success' : 'buffer',
"          \ 'outputter/error/error'   : 'quickfix',
"          \ 'outputter/buffer/split' : ':botright 8sp',
"      \ }
"  \}

if !exists('g:context_filetype#filetypes')
  let g:context_filetype#filetypes = {}
endif

let g:switch_mapping = 'S'

let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

let g:neosnippet#snippets_directory = '$DOTPATH/vim/snippets/, $XDG_CACHE_HOME/nvim/plugged/neosnippet-snippets/neosnippets/'
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" LaTeX
call lexima#add_rule({'char': '$', 'input_after': '$', 'filetype': 'tex'})
call lexima#add_rule({'char': '$', 'at': '\%#\$', 'leave': 1, 'filetype': 'tex'})
call lexima#add_rule({'char': '<BS>', 'at': '\$\%#\$', 'delete': 1, 'filetype': 'tex'})
