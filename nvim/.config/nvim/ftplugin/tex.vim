nmap \al :TXaddlabel()<CR>

let g:vimtex_enabled=1
let g:vimtex_view_method = 'zathura'
let g:vimtex_complete_recursive_bib=1
let g:vimtex_view_general_viewer = 'zathura' 
lua require('nvim-autopairs').remove_rule('"')
let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
