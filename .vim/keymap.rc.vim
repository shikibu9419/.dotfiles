" Normal Mode
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
nnoremap <Esc><Esc> :noh<CR>
inoremap <F1> <Esc>
noremap  <F1> <Esc>

" Insert Mode
inoremap jj <Esc>

" Command Mode
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

" Visual Mode
vnoremap < <gv
vnoremap > >gv
