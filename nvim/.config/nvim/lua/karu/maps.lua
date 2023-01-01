vim.g.mapleader = " "

local opts = {}

vim.keymap.set("n","<C-n>", vim.cmd.Ex)
vim.keymap.set("n","<leader>vp", 'vi"p', opts)
vim.keymap.set('n','<leader>r', ':source %<CR>', opts)
vim.keymap.set('n','<leader>y', '"+y', opts)
vim.keymap.set('v','<leader>y', '"+y', opts)
vim.keymap.set('n','<C-j>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', opts)
vim.keymap.set('n','<C-k>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', opts)
vim.keymap.set('n', 'Y', "y$", opts)
vim.keymap.set('n', '<leader>tt', ":e $HOME/vimwiki/TODO.md", opts)
vim.keymap.set('v', 'J'," :m '>+1<CR>gv=gv",opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', '<C-r>', "hy:%s/<C-r>h//gc<left><left><left>", opts)


-- Quickfix list
vim.keymap.set('n', '<leader>co', ":copen<CR>", opts)
vim.keymap.set('n', '<leader>cn', ":cnext<CR>", opts)
vim.keymap.set('n', '<leader>cp', ":cprev<CR>", opts)
vim.keymap.set('n', 'vg', function ()
	local input = vim.fn.input("Vimgrep > ")
	vim.cmd(':vimgrep "'..input..'" **/*')
	vim.cmd(':copen')
end)


