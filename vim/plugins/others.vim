"" Tmux navigator & neoterm
let g:tmux_navigator_no_mappings = 1
let g:neoterm_autoscroll = 1
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'belowright'

"" smooth scroll
let g:ac_smooth_scroll_du_sleep_time_msec = 7
let g:ac_smooth_scroll_fb_sleep_time_msec = 7

"" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

"" file-icons
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['html'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['css'] = ''
let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols['txt'] = ''

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"" context_filetype
if !exists('g:context_filetype#filetypes')
  let g:context_filetype#filetypes = {}
endif
