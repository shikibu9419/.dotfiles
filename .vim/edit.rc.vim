"------------------------------------------
" Search & Replace
"------------------------------------------
" インクリメンタルサーチを行う
set incsearch
" 検索にマッチした部分を強調表示
set hls
" 大文字/小文字の区別なく検索
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索
set smartcase
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 置換時、g オプションをデフォルトに
set gdefault


"------------------------------------------
" Edit
"------------------------------------------
" 行を跨いだ移動
set whichwrap=b,s,h,l,<,>,[,]
" 入力コマンドの表示
set showcmd
" マウス入力を有効に
if !has('nvim')
  set ttymouse=xterm2
endif
set mouse=a
" backspaceを有効に
set backspace=indent,eol,start
" クリップボード設定
set clipboard+=unnamed
" バッファを削除しない
set hidden
" ヴィジュアル短形で行末以降も選択可能
set virtualedit=block
" バックアップ・スワップファイルを作らない
set nobackup
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" 入力した括弧に対応する括弧にカーソルが飛ぶ(0.1秒間)
set showmatch
set matchtime=1
" 改行時コメント継続を防ぐ
autocmd FileType * setlocal formatoptions-=ro
" コマンドモードの補完
set wildmenu
" コマンドパターンを1000個まで履歴に残す
set history=1000
" %移動の拡張
set matchpairs+=<:>
if !exists('loaded_matchit')
  runtime macros/matchit.vim
endif

" 保存時ファイルタイプを再アサイン
augroup asign
  autocmd!
  autocmd BufWritePost *
        \ if &filetype ==# '' && exists('b:ftdetect') |
        \  unlet! b:ftdetect |
        \  filetype detect |
        \ endif
augroup END
