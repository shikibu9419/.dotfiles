let g:fzf_layout = { 'down': '~30%' }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
\  'ctrl-t': 'tab split',
\  'ctrl-x': 'split',
\  'ctrl-v': 'vsplit'
\}

command! -bang -nargs=? -complete=dir FzfFiles
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang FzfColors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
command! -bang -nargs=* FzfRg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

command! FzfFileList call fzf#run({
  \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store', 'sink': 'e'
  \ })
command! FzfMostRecentlyUsed call fzf#run({
  \ 'scommand!ource': v:oldfiles, 'sink': 'tabe', 'options': '-m -x +s', 'down': '40%'
  \ })
