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
    Plug 'mattn/vim-lsp-settings'
    Plug 'mattn/vim-lsp-icons'
    " Plug 'hrsh7th/vim-vsnip'
    " Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'posva/vim-vue', { 'for': 'vue' }
    Plug 'mattn/vim-goimports', { 'for': 'go' }
    "" NERDTree
    Plug 'scrooloose/nerdtree', { 'on': ['NERDTree'] }
    Plug 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTree'] }
    "" Git
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    "" Tmux
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'tmux-plugins/vim-tmux-focus-events'
    "" Fuzzy Finder
    " Plug 'Shougo/denite.nvim'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    "" Terminal & Shell
    Plug 'kassio/neoterm'
    "" Others
    Plug 'editorconfig/editorconfig-vim'
    Plug 'cohama/lexima.vim'
    " Plug 'w0rp/ale'
    Plug 'osyo-manga/vim-over'
    Plug 'thinca/vim-quickrun'
    Plug 'Shougo/vimproc.vim', {'do' : 'make'}
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

  Plug 'terryma/vim-multiple-cursors'
  Plug 'mattn/vim-sonictemplate'
  Plug 'rhysd/accelerated-jk'
  Plug 'yonchu/accelerated-smooth-scroll'
  Plug 'unblevable/quick-scope'
  Plug 'rhysd/clever-f.vim'
  Plug 'AndrewRadev/switch.vim'
  Plug 'machakann/vim-sandwich'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'junegunn/vim-easy-align'
  Plug 'tyru/open-browser.vim', { 'on': ['OpenBrowser', '<Plug>(openbrowser-'] }
  Plug 'tyru/caw.vim'
  Plug 'haya14busa/vim-asterisk'
  Plug 'arthurxavierx/vim-caser'
  " Plug 'folke/which-key.nvim'
call plug#end()

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

" lua << EOF
"   require("which-key").setup {
"     -- your configuration comes here
"     -- or leave it empty to use the default settings
"     -- refer to the configuration section below
"   }
" EOF

let g:sonictemplate_vim_template_dir = expand('$DOTPATH/vim/plugins/sonictemplate')
let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 1
let g:clever_f_smart_case = 1
let g:clever_f_fix_key_direction = 1
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
" Trigger a highlight only when pressing f and F.
let g:qs_highlight_on_keys = ['f', 'F']

let g:switch_mapping = 'S'
let s:switch_definition = {
  \ 'rails' : [
  \   [100, ':continue', ':information'],
  \   [101, ':switching_protocols'],
  \   [102, ':processing'],
  \   [200, ':ok', ':success'],
  \   [201, ':created'],
  \   [202, ':accepted'],
  \   [203, ':non_authoritative_information'],
  \   [204, ':no_content'],
  \   [205, ':reset_content'],
  \   [206, ':partial_content'],
  \   [207, ':multi_status'],
  \   [208, ':already_reported'],
  \   [226, ':im_used'],
  \   [300, ':multiple_choices'],
  \   [301, ':moved_permanently'],
  \   [302, ':found'],
  \   [303, ':see_other'],
  \   [304, ':not_modified'],
  \   [305, ':use_proxy'],
  \   [306, ':reserved'],
  \   [307, ':temporary_redirect'],
  \   [308, ':permanent_redirect'],
  \   [400, ':bad_request'],
  \   [401, ':unauthorized'],
  \   [402, ':payment_required'],
  \   [403, ':forbidden'],
  \   [404, ':not_found'],
  \   [405, ':method_not_allowed'],
  \   [406, ':not_acceptable'],
  \   [407, ':proxy_authentication_required'],
  \   [408, ':request_timeout'],
  \   [409, ':conflict'],
  \   [410, ':gone'],
  \   [411, ':length_required'],
  \   [412, ':precondition_failed'],
  \   [413, ':request_entity_too_large'],
  \   [414, ':request_uri_too_long'],
  \   [415, ':unsupported_media_type'],
  \   [416, ':requested_range_not_satisfiable'],
  \   [417, ':expectation_failed'],
  \   [422, ':unprocessable_entity'],
  \   [423, ':precondition_required'],
  \   [424, ':too_many_requests'],
  \   [426, ':request_header_fields_too_large'],
  \   [500, ':internal_server_error'],
  \   [501, ':not_implemented'],
  \   [502, ':bad_gateway'],
  \   [503, ':service_unavailable'],
  \   [504, ':gateway_timeout'],
  \   [505, ':http_version_not_supported'],
  \   [506, ':variant_also_negotiates'],
  \   [507, ':insufficient_storage'],
  \   [508, ':loop_detected'],
  \   [510, ':not_extended'],
  \   [511, ':network_authentication_required'],
  \ ]
  \ }
