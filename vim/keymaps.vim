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

"" Command replacement
noremap  H ^
noremap  L $
noremap  ; :
noremap  : ;
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

"" Emacs commands
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
nnoremap <Space>o :only<CR>

inoremap jj <Esc>

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
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

nnoremap <silent> tn :tabnext<CR>
nnoremap <silent> tp :tabprevious<CR>
nnoremap <silent> tc :tablast <bar> tabnew<CR>
for index in range(1, 9)
  execute 'nnoremap <silent> t'.index  ':<C-u>tabnext'.index.'<CR>'
endfor

"" Using <Leader> or <Space>
nmap <silent> <Space>n  <plug>NERDTreeTabsToggle<CR>
nmap <silent> <Leader>d <Plug>DashSearch
map  <silent> <Leader>b <Plug>(openbrowser-smart-search)
nmap <silent> <Leader>r <Plug>(quickrun)

map <C-j> [fzf]
nnoremap [fzf]<C-b> :FzfBuffers<CR>
nnoremap [fzf]<C-c> :FzfColors<CR>
nnoremap [fzf]<C-f> :FzfGFiles?<CR>
nnoremap [fzf]<C-l> :FzfFiles<CR>
nnoremap [fzf]<C-m> :FzfMostRecentlyUsed<CR>
nnoremap [fzf]<C-r> :FzfRg<CR>
nnoremap [fzf]<C-x> :FzfCommands<CR>

map <Leader>g [git]
nmap [git]s :<C-u>Gstatus<CR>
nmap [git]d :<C-u>Gdiff<CR>
nmap [git]b :<C-u>Gblame<CR>
nmap [git]l :<C-u>Glog<CR>
nmap [git]p <Plug>GitGutterPrevHunk
nmap [git]n <Plug>GitGutterNextHunk

map <Leader>l [lsp]
nnoremap <buffer> [lsp]d :<C-u>LspDefinition<CR>
nnoremap <buffer> [lsp]r :<C-u>LspReferences<CR>
" nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
" nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
" nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
" vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
" nnoremap <buffer> K :<C-u>LspHover<CR>
" nnoremap <buffer> <F1> :<C-u>LspImplementation<CR>
" nnoremap <buffer> <F2> :<C-u>LspRename<CR>

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
