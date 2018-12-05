"" normal mode
nnoremap q: :q
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap <Esc> :noh<CR>
" nnoremap <Leader>m :<C-u>marks
" nnoremap <Leader>r :<C-u>registers
nnoremap <Leader>s :split 
nnoremap <Leader>v :vsplit 
nnoremap <Leader>q <Esc>:q
nnoremap <Leader>, :source $MYVIMRC<CR>

"" insert mode
inoremap <F1> <Esc>
noremap  <F1> <Esc>

"" command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"" visual mode
vnoremap < <gv
vnoremap > >gv

"----------------------------------------------
" Plugins
"----------------------------------------------
map ga <Nop>
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" nmap <leader><tab> <plug>(fzf-maps-n)
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)

"" using <Leader>
nmap <silent> <Leader>d <Plug>DashSearch
nmap <silent> <Leader>n :NERDTreeToggle<CR>
nmap <silent> <Leader>o :OverCommandLine<CR>
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)
nmap <Leader>r <Plug>(quickrun)
nmap <Leader>s :SyntasticCheck<CR>

""" prefix
map <Leader>f [fzf]
map <Leader>g [fugitive]
map <Leader>l [lsp]
" map <Leader>n [nerdtree]

""" keybinds
nmap [fzf]l :FzfFileList<CR>
nmap [fzf]m :FzfMostRecentlyUsed<CR>
command! FzfFileList call fzf#run({
  \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store', 'sink': 'e'
  \ })
command! FzfMostRecentlyUsed call fzf#run({
  \ 'scommand!ource': v:oldfiles, 'sink': 'tabe', 'options': '-m -x +s', 'down': '40%'
  \ })

nmap <silent> [fugitive]s :<C-u>Gstatus<CR>
nmap <silent> [fugitive]d :<C-u>Gdiff<CR>
nmap <silent> [fugitive]b :<C-u>Gblame<CR>
nmap <silent> [fugitive]l :<C-u>Glog<CR>

nmap <silent> [lsp]h :call LanguageClient_textDocument_hover()<CR>
nmap <silent> [lsp]d :call LanguageClient_textDocument_definition()<CR>
nmap <silent> [lsp]r :call LanguageClient_textDocument_rename()<CR>
nmap <silent> [lsp]f :call LanguageClient_textDocument_formatting()<CR>
