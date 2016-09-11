"-----------------------
"表示設定
"-----------------------
"編集中のファイル名を表示
set title
"行番号の表示
set number
"0が前置されていても10進数と認識(デフォルトは8進数)
set nrformats=
"末尾から2行目にステータスラインを表示
set laststatus=2
" 編集行番号のハイライト
set cursorline
hi clear CursorLine
hi LineNr ctermfg=241

"-----------------------
"検索・置換え設定
"-----------------------
"検索にマッチした部分を強調表示
set hls
"大文字/小文字の区別なく検索
set ignorecase
"検索文字列に大文字が含まれている場合は区別して検索
set smartcase
"検索時に最後まで行ったら最初に戻る
set wrapscan

"-----------------------
"インデント設定
"-----------------------
" Tab文字の可視化
set list listchars=tab:\▸\ 
" Tab文字を半角スペース4つ分に設定
set tabstop=4
" 改行時に前のインデントを継続
set autoindent
" Vimの自動インデント幅を4つに設定
set shiftwidth=4

"-----------------------
"キーボード入力
"-----------------------
"[ノーマルモード] j, kが表示行単位の移動に
nnoremap j gj
nnoremap k gk
"[ノーマルモード] Yを行末までのヤンクに
nnoremap Y y$
"[ノーマルモード] 数字のインクリメント/デクリメント
nnoremap + <C-a>
nnoremap - <C-x>
"[ノーマルモード] Enterキーで改行
nnoremap <CR> o<Esc>
"[インサートモード] jjと入力するとコマンドモードに
inoremap jj <Esc>:
"[インサートモード] 閉じ括弧を自動的に入力
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"-----------------------
"その他
"-----------------------
"複数ファイルを編集...?
set hidden
"ヴィジュアル短形で行末以降も選択可能
set virtualedit=block
"スワップファイルを作らない
set noswapfile
"編集中のファイルが変更されたら自動で読み直す
set autoread
"入力した括弧に対応する括弧にカーソルが飛ぶ(0.1秒間)
set showmatch
set matchtime=1
"コマンドパターンを100個まで履歴に残す
set history=100
