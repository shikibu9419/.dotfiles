let g:LanguageClient_serverCommands = {
  \ 'ruby': ['solargraph', 'stdio'],
\}

augroup LanguageClientConfig
  autocmd!
  autocmd User LanguageClientStarted setlocal signcolumn=yes
  autocmd User LanguageClientStopped setlocal signcolumn=auto
augroup END

let g:LanguageClient_autoStart = 1
