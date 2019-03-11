let mapleader = ","

"" Nops
noremap  ga <Nop>
nnoremap Q  <Nop>
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap q: <Nop>
noremap  <C-c> <Nop>
imap <F1> <Esc>
map  <F1> <Esc>

"" Command replace
noremap  <Space>h ^
noremap  <Space>l $
nnoremap <Space>/ *
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
vnoremap < <gv
vnoremap > >gv

"" Resize window
nnoremap <S-Left>  <C-w>>
nnoremap <S-Right> <C-w><
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

"" Like Emacs
inoremap <C-a> <C-o>^
inoremap <C-e> <C-o>$
inoremap <C-f> <C-o>w
inoremap <C-b> <C-o>b
inoremap <C-d> <C-o>x

" Others
nnoremap <C-q> :qall<CR>
nnoremap <Esc> :noh<CR>
nnoremap <Space>s :split 
nnoremap <Space>v :vsplit 
nnoremap <Space>, :source $MYVIMRC<CR>
nnoremap <Space>m :<C-u>marks
nnoremap <Space>r :<C-u>registers

inoremap jj <Esc>

cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cabbr w!! w !sudo tee > /dev/null %

"----------------------------------------------
" Plugins
"----------------------------------------------
map  ga    <Plug>(EasyAlign)
map  <C-c> <Plug>(caw:zeropos:toggle)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<CR>

"" Ariline Tab
nmap <silent> <C-p> <Plug>AirlineSelectPrevTab
nmap <silent> <C-n> <Plug>AirlineSelectNextTab
nmap <silent> tc :tablast <bar> tabnew<CR>
nmap <silent> tx :tabclose<CR>
for index in range(1, 9)
  execute 'nnoremap <silent> t'.index  ':<C-u>tabnext'.index.'<CR>'
endfor

"" Using <Leader> or <Space>
nmap <silent> <Space>d <Plug>DashSearch
nmap <silent> <Space>n <plug>NERDTreeTabsToggle<CR>
map  <silent> <Space>o :OverCommandLine<CR>

map  <silent> <Leader>b <Plug>(openbrowser-smart-search)
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
nmap <silent> [git]p <Plug>GitGutterPrevHunk
nmap <silent> [git]n <Plug>GitGutterNextHunk

nmap <silent> [lsp]h :call LanguageClient_textDocument_hover()<CR>
nmap <silent> [lsp]d :call LanguageClient_textDocument_definition()<CR>
nmap <silent> [lsp]r :call LanguageClient_textDocument_rename()<CR>
nmap <silent> [lsp]f :call LanguageClient_textDocument_formatting()<CR>
