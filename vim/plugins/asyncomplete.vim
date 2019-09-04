set completeopt+=preview

let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_buffer_clear_cache = 1
let g:asyncomplete_log_file = expand('$XDG_CACHE_HOME/asyncomplete.log')

let g:lsp_log_verbose = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 0
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}
let g:lsp_log_file = expand('$XDG_CACHE_HOME/vim-lsp.log')

"" autocmds
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
      \ 'name': 'buffer',
      \ 'whitelist': ['*'],
      \ 'blacklist': ['go'],
      \ 'completor': function('asyncomplete#sources#buffer#completor'),
      \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
      \ 'name': 'file',
      \ 'whitelist': ['*'],
      \ 'priority': 5,
      \ 'completor': function('asyncomplete#sources#file#completor')
      \ }))
au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#neosnippet#get_source_options({
      \ 'name': 'neosnippet',
      \ 'whitelist': ['*'],
      \ 'completor': function('asyncomplete#sources#neosnippet#completor'),
      \ }))

"" pip install python-language-server
if executable('pyls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': { server_info -> ['pyls'] },
        \ 'whitelist': ['python'],
        \ 'workspace_config': {'pyls': {'plugins': {
        \   'pycodestyle': {'enabled': v:false},
        \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
        \})
endif

"" gem install solargraph
if executable('solargraph')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'whitelist': ['ruby'],
        \})
endif

"" go get golang.org/x/tools/cmd/gopls
if executable('gopls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

"" npm install -g typescript typescript-language-server
if executable('typescript-language-server')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'javascript support using typescript-language-server',
        \ 'cmd': { server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri': { server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), '.git/..'))},
        \ 'whitelist': ['javascript', 'javascript.jsx']
        \ })
endif

if executable('vls')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'vue-language-server',
        \ 'cmd': {server_info->['vls']},
        \ 'whitelist': ['vue'],
        \ 'initialization_options': {
        \         'config': {
        \             'html': {},
        \              'vetur': {
        \                  'validation': {}
        \              }
        \         }
        \     }
        \ })

"   " omnifunc
"   au FileType vue setlocal omnifunc=lsp#complete
"   " map
"   au FileType vue nnoremap <buffer><silent> gd :<C-u>LspDefinition<CR>
"   au FileType vue nnoremap <buffer><silent> gD :<C-u>LspReferences<CR>
"   au FileType vue nnoremap <buffer><silent> gs :<C-u>LspDocumentSymbol<CR>
"   au FileType vue nnoremap <buffer><silent> gS :<C-u>LspWorkspaceSymbol<CR>
"   au FileType vue nnoremap <buffer><silent> gQ :<C-u>LspDocumentFormat<CR>
"   au FileType vue vnoremap <buffer><silent> gQ :LspDocumentRangeFormat<CR>
"   au FileType vue nnoremap <buffer><silent> K :<C-u>LspHover<CR>
"   au FileType vue nnoremap <buffer><silent> <F1> :<C-u>LspImplementation<CR>
"   au FileType vue nnoremap <buffer><silent> <F2> :<C-u>LspRename<CR>
endif
