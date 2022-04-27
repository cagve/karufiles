inoremap <C-u> <c-g>u<Esc>[s1z=`]a<c-g>u 
nmap \al :TXaddlabel()<CR>

set spell
set spelllang=es
set textwidth=80
set conceallevel=2 
set concealcursor=c 

let g:vimtex_enabled=1
let g:vimtex_view_method = 'zathura'
let g:vimtex_complete_recursive_bib=1
let g:vimtex_view_general_viewer = 'zathura' 
lua require('nvim-autopairs').remove_rule('"')
