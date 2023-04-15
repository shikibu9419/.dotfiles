let g:jetpack#optimization = 1

call jetpack#begin()
  "" Neovim only
  if !exists('g:vscode')
    "" completion
    Jetpack 'prabirshrestha/async.vim'
    Jetpack 'prabirshrestha/asyncomplete.vim'
    Jetpack 'prabirshrestha/asyncomplete-lsp.vim'
    Jetpack 'prabirshrestha/asyncomplete-buffer.vim'
    Jetpack 'prabirshrestha/asyncomplete-file.vim'
    Jetpack 'prabirshrestha/asyncomplete-neosnippet.vim'
    Jetpack 'prabirshrestha/vim-lsp'
    Jetpack 'mattn/vim-lsp-settings'
    Jetpack 'mattn/vim-lsp-icons'
    " Jetpack 'hrsh7th/vim-vsnip'
    " Jetpack 'hrsh7th/vim-vsnip-integ'
    Jetpack 'posva/vim-vue', { 'for': 'vue' }
    Jetpack 'mattn/vim-goimports', { 'for': 'go' }
    "" NERDTree
    Jetpack 'scrooloose/nerdtree', { 'on': ['NERDTree'] }
    Jetpack 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTree'] }
    "" Git
    Jetpack 'tpope/vim-fugitive'
    Jetpack 'airblade/vim-gitgutter'
    "" Tmux
    Jetpack 'christoomey/vim-tmux-navigator'
    Jetpack 'tmux-plugins/vim-tmux-focus-events'
    "" Fuzzy Finder
    " Jetpack 'Shougo/denite.nvim'
"     Jetpack '/usr/local/opt/fzf'
    Jetpack 'junegunn/fzf.vim'
    "" Terminal & Shell
    Jetpack 'kassio/neoterm'
    "" Others
    Jetpack 'editorconfig/editorconfig-vim'
    Jetpack 'cohama/lexima.vim'
    " Jetpack 'w0rp/ale'
    Jetpack 'osyo-manga/vim-over'
    Jetpack 'thinca/vim-quickrun'
    Jetpack 'Shougo/vimproc.vim', { 'do' : 'make' }
    Jetpack 'rizzatti/dash.vim'
    "" Appearance
    Jetpack 'itchyny/lightline.vim'
    Jetpack 'nathanaelkane/vim-indent-guides'
    Jetpack 'ryanoasis/vim-devicons'
    Jetpack 'Shougo/context_filetype.vim'
    Jetpack 'osyo-manga/vim-precious'
    "" colorschemes
    Jetpack 'flazz/vim-colorschemes'
    "" syntax highlights
    Jetpack 'sheerun/vim-polyglot'
    "" ftplugins
    Jetpack 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
    Jetpack 'plytophogy/vim-virtualenv',     { 'for': 'python' }
    Jetpack 'tpope/vim-rails',               { 'for': 'ruby' }
    Jetpack 'todesking/ruby_hl_lvar.vim',    { 'for': 'ruby' }
    Jetpack 'mechatroner/rainbow_csv',       { 'for': 'csv' }
    "" Snippets
    Jetpack 'Shougo/neosnippet.vim'
    Jetpack 'Shougo/neosnippet-snippets'
  endif

  Jetpack 'terryma/vim-multiple-cursors'
  Jetpack 'mattn/vim-sonictemplate'
  Jetpack 'rhysd/accelerated-jk'
  Jetpack 'yonchu/accelerated-smooth-scroll'
  Jetpack 'unblevable/quick-scope'
  Jetpack 'rhysd/clever-f.vim'
  Jetpack 'AndrewRadev/switch.vim'
  Jetpack 'machakann/vim-sandwich'
  Jetpack 'bronson/vim-trailing-whitespace'
  Jetpack 'junegunn/vim-easy-align'
  Jetpack 'tyru/open-browser.vim', { 'on': ['OpenBrowser', '<Jetpack>(openbrowser-'] }
  Jetpack 'tyru/caw.vim'
  Jetpack 'haya14busa/vim-asterisk'
  Jetpack 'arthurxavierx/vim-caser'
  " Jetpack 'folke/which-key.nvim'
call jetpack#end()

if !exists('g:vscode')
  "" quickrun
  set splitbelow
  set splitright
  let g:quickrun_no_default_key_mappings = 1

  "" snippets directory
"   let g:neosnippet#snippets_directory = '$DOTPATH/vim/snippets/, ' . s:plug_repo_dir . '/neosnippet-snippets/neosnippets/'

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
