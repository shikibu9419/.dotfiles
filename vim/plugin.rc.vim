if !&compatible
  set nocompatible
endif
filetype plugin indent off

set runtimepath+=$DOTPATH/vim/dein.vim
let s:dein_dir = expand('~/.cache/dein')
" let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

if dein#load_state(s:dein_dir)
  let s:toml_dir  = '$DOTPATH/vim'
  let s:toml      = s:toml_dir . '/dein.toml'
  let s:lazytoml  = s:toml_dir . '/deinlazy.toml'

  call dein#begin(s:dein_dir)
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazytoml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on
