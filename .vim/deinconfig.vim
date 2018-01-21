"------------------------------------------
" Dein.vim
"------------------------------------------
if !&compatible
  set nocompatible
endif
filetype off

" <Leader> setting
let mapleader="\<Space>"

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . 'repos/github.com/Shougo/dein.vim'

set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOML files
  let s:vim_dir   = expand('~/.vim')
  let s:toml      = s:vim_dir . '/dein.toml'
  let s:lazy_toml = s:vim_dir . '/dein_lazy.toml'

  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  call dein#end()
  call dein#save_state()
endif

" Install plugins
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on
syntax on


"------------------------------------------
" lightline.vim (Respected http://itchyny.hatenablog.com/entry/20130828/1377653592)
"------------------------------------------
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive', 'filename' ] ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filename': 'LightlineFilename',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction


"------------------------------------------
" Switch.vim
"------------------------------------------
let s:switch_definition = {
  \ 'rails' : [
  \   [100, ':continue', ':information'],
  \   [101, ':switching_protocols'],
  \   [102, ':processing'],
  \   [200, ':ok', ':success'],
  \   [201, ':created'],
  \   [202, ':accepted'],
  \   [203, ':non_authoritative_information'],
  \   [204, ':no_content'],
  \   [205, ':reset_content'],
  \   [206, ':partial_content'],
  \   [207, ':multi_status'],
  \   [208, ':already_reported'],
  \   [226, ':im_used'],
  \   [300, ':multiple_choices'],
  \   [301, ':moved_permanently'],
  \   [302, ':found'],
  \   [303, ':see_other'],
  \   [304, ':not_modified'],
  \   [305, ':use_proxy'],
  \   [306, ':reserved'],
  \   [307, ':temporary_redirect'],
  \   [308, ':permanent_redirect'],
  \   [400, ':bad_request'],
  \   [401, ':unauthorized'],
  \   [402, ':payment_required'],
  \   [403, ':forbidden'],
  \   [404, ':not_found'],
  \   [405, ':method_not_allowed'],
  \   [406, ':not_acceptable'],
  \   [407, ':proxy_authentication_required'],
  \   [408, ':request_timeout'],
  \   [409, ':conflict'],
  \   [410, ':gone'],
  \   [411, ':length_required'],
  \   [412, ':precondition_failed'],
  \   [413, ':request_entity_too_large'],
  \   [414, ':request_uri_too_long'],
  \   [415, ':unsupported_media_type'],
  \   [416, ':requested_range_not_satisfiable'],
  \   [417, ':expectation_failed'],
  \   [422, ':unprocessable_entity'],
  \   [423, ':precondition_required'],
  \   [424, ':too_many_requests'],
  \   [426, ':request_header_fields_too_large'],
  \   [500, ':internal_server_error'],
  \   [501, ':not_implemented'],
  \   [502, ':bad_gateway'],
  \   [503, ':service_unavailable'],
  \   [504, ':gateway_timeout'],
  \   [505, ':http_version_not_supported'],
  \   [506, ':variant_also_negotiates'],
  \   [507, ':insufficient_storage'],
  \   [508, ':loop_detected'],
  \   [510, ':not_extended'],
  \   [511, ':network_authentication_required'],
  \ ]
  \ }
