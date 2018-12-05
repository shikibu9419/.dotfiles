"" Normal Mode
nnoremap q: :q
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
" nnoremap <Leader>m :<C-u>marks
" nnoremap <Leader>r :<C-u>registers
nnoremap <Leader>v :vsplit 
nnoremap <Leader>s :split 
nnoremap <Leader>q <Esc>:q<CR>
nnoremap <Leader>. :tabedit $HOME/.vim/vimrc<CR>
nnoremap <Leader>, :source $MYVIMRC<CR>
nnoremap <Esc> :noh<CR>

"" Insert Mode
inoremap <F1> <Esc>
noremap  <F1> <Esc>

"" Command Mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"" Visual Mode
vnoremap < <gv
vnoremap > >gv

"----------------------------------------------
" Plugins using <Leader>
"----------------------------------------------
nmap <Leader>r <Plug>(quickrun)
nmap <Leader>b <Plug>(openbrowser-smart-search)
vmap <Leader>b <Plug>(openbrowser-smart-search)
nmap <Leader>s :SyntasticCheck<CR>

"" prefix
map <Leader>f [fzf]
map <Leader>g [fugitive]
map <Leader>l [lsp]
map <Leader>n [nerdtree]

"" keybinds
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

nmap <Leader>n :NERDTreeToggle<CR>
