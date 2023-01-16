vim.keymap.set('n','<C-t>', '<plug>(vimtex-toc-toggle)')
-- vim.keymap.set('n','<C-p>', '<plug>(vimtex-view)')
vim.keymap.set('n','<C-p>', ':call SVED_Sync()<CR>')
vim.keymap.set('n','<localleader>le', 'vae<plug>(vimtex-compile-selected)')
vim.keymap.set('n','<localleader>lp', 'vap<plug>(vimtex-compile-selected)')
vim.keymap.set('n','<localleader>lt', '<plug>(vimtex-errors)')
vim.keymap.set('n','dsm', 'ds$')
vim.keymap.set('v','<localleader>i', 'c\\textit{<Esc>pa}<Esc>')
vim.keymap.set('v','<localleader>b', 'c\\textbf{<Esc>pa}<Esc>')


vim.api.nvim_set_hl(0, "Conceal", {fg="orange"})
