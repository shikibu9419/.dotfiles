let mapleader = "\<Space>"

imap <F1> <Esc>
map  <F1> <Esc>

"" Normal mode
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
nnoremap q: :q
nnoremap <C-q> :qall<CR>
nnoremap <Esc> :noh<CR>
" nnoremap <Leader>m :<C-u>marks
" nnoremap <Leader>r :<C-u>registers
nnoremap <Leader>s :split 
nnoremap <Leader>v :vsplit 
nnoremap <Leader>, :source $MYVIMRC<CR>

"" Insert mode
inoremap jj <Esc>

"" Command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

"" Visual mode
vnoremap < <gv
vnoremap > >gv

"" Tab
map <silent> <C-n> :tabnext<CR>
map <silent> <C-p> :tabprevious<CR>
map <silent> <Tab>c :tablast <bar> tabnew<CR>
for index in range(1, 9)
  execute 'nnoremap <silent> <Tab>'.index  ':<C-u>tabnext'.index.'<CR>'
endfor

"----------------------------------------------
" Plugins
"----------------------------------------------
"" Prefix key
map <Leader>f [fzf]
map <Leader>g [git]
map <Leader>l [lsp]
" map <Leader>n [nerdtree]
" nmap [denite] <Nop>
" map <C-j> [denite]
" nmap <silent> [denite]<C-D> :Denite -buffer-name=gtags_completion gtags_completion<cr>

map  ga <Nop>
map  <C-c> <Nop>
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
nmap <C-c> <Plug>(caw:zeropos:toggle)
vmap <C-c> <Plug>(caw:zeropos:toggle)
nmap ga <Plug>(EasyAlign)
vmap ga <Plug>(EasyAlign)
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" nmap <leader><tab> <plug>(fzf-maps-n)
" imap <c-x><c-k> <plug>(fzf-complete-word)
" imap <c-x><c-f> <plug>(fzf-complete-path)
" imap <c-x><c-j> <plug>(fzf-complete-file-ag)
" imap <c-x><c-l> <plug>(fzf-complete-line)
" nmap <silent> <C-t>k :<C-u>exe("Gtags ".expand('<cword>'))<CR>
" nmap <silent> <C-t>r :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>

"" Using <Leader>
nmap <silent> <Leader>b <Plug>(openbrowser-smart-search)
vmap <silent> <Leader>b <Plug>(openbrowser-smart-search)
nmap <silent> <Leader>d <Plug>DashSearch
nmap <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
nmap <silent> <Leader>o :OverCommandLine<CR>
nmap <silent> <Leader>r <Plug>(quickrun)
" nmap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
" nmap <Leader>s :SyntasticCheck<CR>

nmap [fzf]l :FzfFileList<CR>
nmap [fzf]m :FzfMostRecentlyUsed<CR>

nmap <silent> [git]s :<C-u>Gstatus<CR>
nmap <silent> [git]d :<C-u>Gdiff<CR>
nmap <silent> [git]b :<C-u>Gblame<CR>
nmap <silent> [git]l :<C-u>Glog<CR>

nmap <silent> [lsp]h :call LanguageClient_textDocument_hover()<CR>
nmap <silent> [lsp]d :call LanguageClient_textDocument_definition()<CR>
nmap <silent> [lsp]r :call LanguageClient_textDocument_rename()<CR>
nmap <silent> [lsp]f :call LanguageClient_textDocument_formatting()<CR>
