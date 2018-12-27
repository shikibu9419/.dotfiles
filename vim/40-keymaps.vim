let mapleader = "\<Space>"

imap <F1> <Esc>
map  <F1> <Esc>

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

inoremap jj <Esc>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
cabbr w!! w !sudo tee > /dev/null %

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

"----------------------------------------------
" Plugins
"----------------------------------------------
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>
inoremap <C-k> <Plug>(neosnippet_expand_or_jump)
snoremap <C-k> <Plug>(neosnippet_expand_or_jump)
xnoremap <C-k> <Plug>(neosnippet_expand_target)
map  <C-c> <Nop>
map  <C-c> <Plug>(caw:zeropos:toggle)
map  ga <Nop>
map  ga <Plug>(EasyAlign)
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
" nmap <silent> <C-t>k :<C-u>exe("Gtags ".expand('<cword>'))<CR>
" nmap <silent> <C-t>r :<C-u>exe("Gtags -r ".expand('<cword>'))<CR>

"" Tab
nmap <C-p> <Plug>AirlineSelectPrevTab
nmap <C-n> <Plug>AirlineSelectNextTab
map <silent> <Tab>c :tablast <bar> tabnew<CR>
for index in range(1, 9)
  execute 'nnoremap <silent> <Tab>'.index  ':<C-u>tabnext'.index.'<CR>'
endfor

"" Using <Leader>
map  <silent> <Leader>b <Plug>(openbrowser-smart-search)
nmap <silent> <Leader>d <Plug>DashSearch
nmap <silent> <Leader>n <plug>NERDTreeTabsToggle<CR>
map  <silent> <Leader>o :OverCommandLine<CR>
nmap <silent> <Leader>r <Plug>(quickrun)
map <Leader>f [fzf]
map <Leader>g [git]
map <Leader>l [lsp]

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
