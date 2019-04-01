let g:fzf_layout = { 'down': '~30%' }
let g:fzf_command_prefix = 'Fzf'
let g:fzf_action = {
\  'ctrl-t': 'tab split',
\  'ctrl-x': 'split',
\  'ctrl-v': 'vsplit'
\}

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! FzfFileList call fzf#run({
  \ 'source': 'find . -type d -name .git -prune -o ! -name .DS_Store', 'sink': 'e'
  \ })
command! FzfMostRecentlyUsed call fzf#run({
  \ 'scommand!ource': v:oldfiles, 'sink': 'tabe', 'options': '-m -x +s', 'down': '40%'
  \ })
