vim.keymap.set('n', '<leader>lt', ":! pandoc --pdf-engine=xelatex -V colorlinks=true  -V linkcolor=blue -V urlcolor=red -V toccolor=gray % -o out.pdf<CR>", {})
