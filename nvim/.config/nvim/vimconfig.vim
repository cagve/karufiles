" Multiple autocommands can be specified like so -
augroup nvim_ghost_user_autocommands
  au User www.overleaf.com set filetype=tex
augroup END

au BufNewFile ~/vimwiki/diary/*.md :silent 0r !~/scripts/generate-vimwiki-diary-template '%'

