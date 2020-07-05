let s:plug_repo_dir = '$XDG_CACHE_HOME/nvim/plugged'

call plug#begin(s:plug_repo_dir)
  "" Neovim only
  if !exists('g:vscode')
    "" completion
    Plug 'prabirshrestha/async.vim'
    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/asyncomplete-buffer.vim'
    Plug 'prabirshrestha/asyncomplete-file.vim'
    Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'posva/vim-vue'
    "" NERDTree
    Plug 'scrooloose/nerdtree'
    Plug 'jistr/vim-nerdtree-tabs'
    "" Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    "" Tmux
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    "" Fuzzy Finder
    Plug 'Shougo/denite.nvim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    "" Terminal & Shell
    Plug 'kassio/neoterm'
    "" Others
    Plug 'w0rp/ale'
    Plug 'osyo-manga/vim-over'
    Plug 'thinca/vim-quickrun'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
    Plug 'tyru/open-browser.vim'
    Plug 'tyru/caw.vim'
    Plug 'cohama/lexima.vim'
    Plug 'rizzatti/dash.vim'
    Plug 'editorconfig/editorconfig-vim'
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
    "" ftplugins
    Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
    Plug 'plytophogy/vim-virtualenv',     { 'for': 'python' }
    Plug 'tpope/vim-rails',               { 'for': 'ruby' }
    Plug 'todesking/ruby_hl_lvar.vim',    { 'for': 'ruby' }
    Plug 'mechatroner/rainbow_csv',       { 'for': 'csv' }
    "" Snippets
    Plug 'Shougo/neosnippet.vim'
    Plug 'Shougo/neosnippet-snippets'
  endif

  Plug 'rhysd/accelerated-jk'
  Plug 'yonchu/accelerated-smooth-scroll'
  Plug 'rhysd/clever-f.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'junegunn/vim-easy-align'
call plug#end()

"" clever-f
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1

if !exists('g:vscode')
  "" quickrun
  set splitbelow
  set splitright
  let g:quickrun_no_default_key_mappings = 1

  "" snippets directory
  let g:neosnippet#snippets_directory = '$DOTPATH/vim/snippets/, ' . s:plug_repo_dir . '/neosnippet-snippets/neosnippets/'

  "" Load plugin config file
  for conf in split(glob('$DOTPATH/vim/plugins/*.vim'),'\n')
    execute 'source' conf
  endfor
endif
