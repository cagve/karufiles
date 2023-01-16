vim.g.mapleader = " "

local opts = {}

vim.keymap.set("n","<C-n>", vim.cmd.Ex)
vim.keymap.set("n","<leader>vp", 'vi"p', opts)
vim.keymap.set('n','<leader>r', ':source %<CR>', opts)
vim.keymap.set('n','<leader>y', '"+y', opts)
vim.keymap.set('v','<leader>y', '"+y', opts)
vim.keymap.set('n','<A-j>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', opts)
vim.keymap.set('n','<A-k>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', opts)
vim.keymap.set('n', 'Y', "y$", opts)
vim.keymap.set('n', '<leader>tt', ":e $HOME/vimwiki/TODO.md", opts)
vim.keymap.set('v', 'J'," :m '>+1<CR>gv=gv",opts)
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', '<C-r>', "hy:%s/<C-r>h//gc<left><left><left>", opts)


-- Quickfix list
local function toggle_qf()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then vim.cmd("cclose") return true end
	end
	vim.cmd("copen")
end

vim.keymap.set('n', '<leader>co', toggle_qf, opts)
vim.keymap.set('n', '<leader>cj', ":cnext<CR>", opts)
vim.keymap.set('n', '<leader>ck', ":cprev<CR>", opts)
vim.keymap.set('n', 'vg', function ()
	local input = vim.fn.input("Vimgrep > ")
	vim.cmd(':vimgrep "'..input..'" **/*')
	vim.cmd(':copen')
end)


-- Movements
vim.keymap.set('n', "<C-h>", require('nvim-tmux-navigation').NvimTmuxNavigateLeft)
vim.keymap.set('n', "<C-j>", require('nvim-tmux-navigation').NvimTmuxNavigateDown)
vim.keymap.set('n', "<C-k>", require('nvim-tmux-navigation').NvimTmuxNavigateUp)
vim.keymap.set('n', "<C-l>", require('nvim-tmux-navigation').NvimTmuxNavigateRight)
vim.keymap.set('n', "<C-\\>", require('nvim-tmux-navigation').NvimTmuxNavigateLastActive)
vim.keymap.set('n', "<C-Space>", require('nvim-tmux-navigation').NvimTmuxNavigateNext)
