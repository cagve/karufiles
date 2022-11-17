" MAPPING
nmap <C-t> <plug>(vimtex-toc-toggle)
nmap <C-p> <plug>(vimtex-view)
nmap <localleader>le vae<plug>(vimtex-compile-selected)
nmap <localleader>lp vap<plug>(vimtex-compile-selected)
nmap <localleader>lt <plug>(vimtex-errors)
nmap dsm ds$
vmap <localleader>i c\textit{<Esc>pa}<Esc>
vmap <localleader>b c\textbf{<Esc>pa}<Esc>


set rtp+=~/ProjectManager/

let g:vimtex_enabled=1
let g:vimtex_view_method = 'zathura'

lua require('nvim-autopairs').remove_rule('"')
