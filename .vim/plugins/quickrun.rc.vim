let g:vimtex_latexmk_callback = 0

let g:quickrun_config['tex'] = {
\  'command' : 'latexmk',
\  'outputter' : 'error',
\  'outputter/error/success' : 'null',
\  'outputter/error/error' : 'null',
\  'srcfile' : expand("%"),
\  'cmdopt': '-pv',
\  'hook/sweep/files' : [
\                      '%S:p:r.aux',
\                      '%S:p:r.bbl',
\                      '%S:p:r.blg',
\                      '%S:p:r.dvi',
\                      '%S:p:r.fdb_latexmk',
\                      '%S:p:r.fls',
\                      '%S:p:r.log',
\                      '%S:p:r.out'
\                      ],
\  'exec': '%c %o %s',
\}

" 部分的に選択してコンパイル
let g:quickrun_config.tmptex = {
\   'exec': [
\           'cp %s template.tex',
\           'latexmk -pdfdvi -pv',
\           ],
\   'outputter' : 'error',
\   'outputter/error/error' : 'null',
\
\   'hook/eval/enable' : 1,
\
\   'hook/eval/template' : '\documentclass[a4paper]{jsarticle}'
\                         .'\usepackage[dvipdfmx]{graphicx, hyperref}'
\                         .'\begin{document}'
\                         .'%s'
\                         .'\end{document}',
\
\   'hook/sweep/files' : [
\                        '%a/tmptex.latex',
\                        '%a/tmptex.out',
\                        '%a/tmptex.fdb_latexmk',
\                        '%a/tmptex.log',
\                        '%a/tmptex.aux',
\                        '%a/tmptex.dvi'
\                        ],
\}

vnoremap <Leader>r :QuickRun -mode v -type tmptex<CR>
