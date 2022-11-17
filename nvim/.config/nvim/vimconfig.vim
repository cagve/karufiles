" VIM WIKI
set nocompatible
filetype plugin on
syntax on


let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0


" GHOST 
let g:nvim_ghost_disabled = 1
augroup nvim_ghost_user_autocommands
  au User https://sharelatex.irit.fr/project set filetype=tex
augroup END

" COLORSCHEME
set background=dark
colorscheme gruvbox

if has('termguicolors')
    set termguicolors
endif

