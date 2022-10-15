" MAPPING
nmap <C-t> <plug>(vimtex-toc-toggle)
nmap <C-p> <plug>(vimtex-view)
nmap <localleader>le vae<plug>(vimtex-compile-selected)
nmap <localleader>lp vap<plug>(vimtex-compile-selected)
nmap <localleader>lt :lua require('karu.tex').quickfix_toggle()<CR>
imap <C-u> <c-g>u<Esc>[s1z=`]a<c-g>u
vmap <localleader>i c\textit{<Esc>pa}<Esc>
vmap <localleader>b c\textbf{<Esc>pa}<Esc>

set rtp+=~/ProjectManager/
" VIMTEX CONFIGURATION
let g:vimtex_enabled=1
let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'zathura' 
let g:vimtex_quickfix_mode=0

" let g:vimtex_quickfix_ignore_filters = [
"       \ 'Underfull',
"       \ 'Overfull',
"       \]

lua require('nvim-autopairs').remove_rule('"')
    
