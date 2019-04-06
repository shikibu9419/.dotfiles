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

"" Replace maps
noremap  H ^
noremap  L $
noremap  ; :
noremap  : ;
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>
vnoremap < <gv
vnoremap > >gv
nnoremap x "_x
nnoremap <C-s> <C-l> " C-l is used as prefix of lsp-keymap

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

"" Quickfix
function! ToggleQuickfix()
    let l:nr = winnr('$')
    cwindow
    let l:nr2 = winnr('$')
    if l:nr == l:nr2
        cclose
    endif
endfunction
nnoremap <script> <silent> <Space>f :call ToggleQuickfix()<cr>
nnoremap <silent> <C-p> :<C-u>cp<cr>
nnoremap <silent> <C-n> :<C-u>cn<cr>

"" Others
inoremap jj <Esc>

nnoremap <C-q> :qall<cr>
nnoremap <Esc> :noh<cr>
nnoremap <Space>s :split 
nnoremap <Space>v :vsplit 
nnoremap <Space>, :source $MYVIMRC<cr>
nnoremap <Space>m :<C-u>marks
nnoremap <Space>r :<C-u>registers
nnoremap <Space>o :only<cr>
nnoremap <Space>p "0p
nnoremap <Space><Space> <C-^>

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cabbr w!! w !sudo tee > /dev/null %

" tab
nnoremap <silent> tn :tabnext<cr>
nnoremap <silent> tp :tabprevious<cr>
nnoremap <silent> tc :tablast <bar> tabnew<cr>
for index in range(1, 9)
  execute 'nnoremap <silent> t'.index  ':<C-u>tabnext'.index.'<cr>'
endfor

"----------------------------------------------
" Plugins
"----------------------------------------------
map  ga <Plug>(EasyAlign)
nmap j  <Plug>(accelerated_jk_gj)
nmap k  <Plug>(accelerated_jk_gk)

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

map  <C-c> <Plug>(caw:zeropos:toggle)
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)
inoremap <C-l> <C-r>=lexima#insmode#leave(1, '<LT>C-G>U<LT>RIGHT>')<cr>

"" Tmux
nnoremap <silent> <C-f>h  :TmuxNavigateLeft<cr>
nnoremap <silent> <C-f>j  :TmuxNavigateDown<cr>
nnoremap <silent> <C-f>k  :TmuxNavigateUp<cr>
nnoremap <silent> <C-f>l  :TmuxNavigateRight<cr>
nnoremap <silent> <C-f>\\ :TmuxNavigatePrevious<cr>

"" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

"" ale
nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)

"" lsp
map <C-l> [lsp]
nnoremap <buffer> [lsp]<C-d> :<C-u>LspDefinition<cr>
nnoremap <buffer> [lsp]<C-r> :<C-u>LspReferences<cr>
" nnoremap <buffer> gs :<C-u>LspDocumentSymbol<cr>
" nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<cr>
" nnoremap <buffer> gQ :<C-u>LspDocumentFormat<cr>
" vnoremap <buffer> gQ :LspDocumentRangeFormat<cr>
" nnoremap <buffer> K :<C-u>LspHover<cr>
" nnoremap <buffer> <F1> :<C-u>LspImplementation<cr>
" nnoremap <buffer> <F2> :<C-u>LspRename<cr>

"" fzf
map <C-j> [fzf]
nnoremap [fzf]<C-b> :FzfBuffers<cr>
nnoremap [fzf]<C-c> :FzfColors<cr>
nnoremap [fzf]<C-f> :FzfGFiles?<cr>
nnoremap [fzf]<C-l> :FzfFiles<cr>
nnoremap [fzf]<C-m> :FzfMostRecentlyUsed<cr>
nnoremap [fzf]<C-r> :FzfRg<cr>
nnoremap [fzf]<C-x> :FzfCommands<cr>

"" use space / leader
nmap <silent> <Space>n  <plug>NERDTreeTabsToggle<cr>
nmap <silent> <Leader>d <Plug>DashSearch
map  <silent> <Leader>b <Plug>(openbrowser-smart-search)
nmap <silent> <Leader>r <Plug>(quickrun)

"" fugigive
map <Leader>g [git]
nnoremap [git]s :<C-u>Gstatus<cr>
nnoremap [git]d :<C-u>Gdiff<cr>
nnoremap [git]b :<C-u>Gblame<cr>
nnoremap [git]l :<C-u>Glog<cr>
nnoremap [git]p <Plug>GitGutterPrevHunk
nnoremap [git]n <Plug>GitGutterNextHunk
