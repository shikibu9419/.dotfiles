source $HOME/.vim/deinconfig.vim
source $HOME/.vim/appearance.vim
source $HOME/.vim/edit.vim

"------------------------------------------
" Maps
"------------------------------------------
" [全モード] .vimrcを開く
noremap <Leader>. :tabedit $MYVIMRC<CR>
" [全モード] .vimrcの再読み込み
noremap <Leader>, :source $MYVIMRC<CR>
" [ノーマルモード] Yを行末までのヤンクに
nnoremap Y y$
" [ノーマルモード] 数字のインクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
" [インサートモード] jjと入力するとコマンドモードに
inoremap jj <Esc>:
" [コマンドモード] <C-p>/<C-n> で履歴を遡る
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>


"------------------------------------------
" Tab (Respect http://qiita.com/wadako111/items/755e753677dd72d8036d)
"------------------------------------------
" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction

let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'
set showtabline=2

" Tab jump (<Tab>n で左からn番目のタブにジャンプ)
for n in range(1, 9)
  execute 'nnoremap <silent> [Tag]'.n  ':<C-u>tabnext'.n.'<CR>'
endfor

" 新しいタブを一番右に作る
map <silent> <Tab>c :tablast <bar> tabnew<CR>
" タブを閉じる
map <silent> <Tab>x :tabclose<CR>
" 次のタブ
map <silent> <Tab>n :tabnext<CR>
" 前のタブ
map <silent> <Tab>p :tabprevious<CR>
