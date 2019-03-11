let g:lsp_log_file = expand('$XDG_CACHE_HOME/vim-lsp.log')
let g:asyncomplete_log_file = expand('$XDG_CACHE_HOME/asyncomplete.log')
let g:asyncomplete_remove_duplicates = 1
let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1
let g:lsp_log_verbose = 1
let g:lsp_signs_enabled = 1
let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_signs_error = {'text': '✗'}
let g:lsp_signs_warning = {'text': '‼'}

setlocal omnifunc+=lsp#complete
set completeopt+=preview

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
imap <c-space> <Plug>(asyncomplete_force_refresh)

augroup vimlsp
  autocmd!
  autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
  if executable('pyls')
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'pyls',
      \ 'cmd': { server_info -> ['pyls'] },
      \ 'whitelist': ['python'],
      \ 'workspace_config': {'pyls': {'plugins': {
      \   'pycodestyle': {'enabled': v:false},
      \   'jedi_definition': {'follow_imports': v:true, 'follow_builtin_imports': v:true},}}}
      \})
  endif
  if executable('solargraph')
    autocmd User lsp_setup call lsp#register_server({
      \ 'name': 'solargraph',
      \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
      \ 'whitelist': ['ruby'],
      \})
  endif
augroup END
