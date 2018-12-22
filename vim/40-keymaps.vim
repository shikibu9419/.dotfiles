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
nnoremap <Leader>s :split 
nnoremap <Leader>v :vsplit 
nnoremap <Leader>, :source $MYVIMRC<CR>
" nnoremap <Leader>m :<C-u>marks
" nnoremap <Leader>r :<C-u>registers

"" Insert mode
inoremap jj <Esc>

"" Command mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
cabbr w!! w !sudo tee > /dev/null %

"" Visual mode
vnoremap < <gv
vnoremap > >gv

"" Like Emacs
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

"" Resize window
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

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
"" Prefix
map <Leader>f [fzf]
map <Leader>g [git]
map <Leader>l [lsp]
" map <Leader>n [nerdtree]
" nmap [denite] <Nop>
" map <C-j> [denite]
" nmap <silent> [denite]<C-D> :Denite -buffer-name=gtags_completion gtags_completion<cr>

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
map  <C-c> <Nop>
map  <C-c> <Plug>(caw:zeropos:toggle)
map  ga <Nop>
map  ga <Plug>(EasyAlign)
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" nmap <silent> <C-t>k :<C-u>exe("Gtags ".expand('<cword>'))<CR>
" nmap <silent> <C-t>r :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>

"" Using <Leader>
map  <silent> <Leader>b <Plug>(openbrowser-smart-search)
nmap <silent> <Leader>d <Plug>DashSearch
nmap <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
map  <silent> <Leader>o :OverCommandLine<CR>
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
