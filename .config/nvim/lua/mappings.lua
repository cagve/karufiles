local keymap = vim.api.nvim_set_keymap

-- General mapping
local opts = {noremap = true}
keymap('n','<leader>r', ':source %<CR>', opts)
keymap('n','<leader>y', '"+y', opts)
keymap('v','<leader>y', '"+y', opts)
keymap('n','<A-j>', ':set paste<CR>m`o<Esc>``:set nopaste<CR>', opts)
keymap('n','<A-k>', ':set paste<CR>m`O<Esc>``:set nopaste<CR>', opts)

-- Harpoon
keymap('n', '<leader>a', ":lua require('harpoon.mark').add_file()<CR>",{})
keymap('n', '<C-e>', ":lua require('harpoon.ui').toggle_quick_menu()<CR>",{})
keymap('n', '<leader>h', ":lua require('harpoon.ui').nav_file(1)<CR>",{})
keymap('n', '<leader>j', ":lua require('harpoon.ui').nav_file(2)<CR>",{})
keymap('n', '<leader>k', ":lua require('harpoon.ui').nav_file(3)<CR>",{})
keymap('n', '<leader>l', ":lua require('harpoon.ui').nav_file(4)<CR>",{})

-- Fugitive
keymap('n',' <leader>g' ,':G<CR>',{})
keymap('n',' <leader>gc',':Gcommit<cr>',{})

-- Telescope
keymap('n', '<leader>ff', "<cmd>lua require('telescope.builtin').find_files()<cr>", {})
keymap('n', '<leader>fg', "<cmd>lua require('telescope.builtin').git_files()<cr>", {})
keymap('n', '<leader>fb', "<cmd>lua require('telescope.builtin').buffers()<cr>", {})
keymap('n', '<leader>fh', "<cmd>lua require('telescope.builtin').help_tags()<cr>", {})
keymap('n', '<leader>gb', "<cmd>lua require('telescope.builtin').git_branches()<cr>", {})
keymap('n', '<leader>fr', "<cmd>lua require('telescope.builtin').live_grep()<cr>", {})

-- Lsp server
keymap('n', '<leader>rn', "<cmd>lua vim.lsp.buf.rename()<cr>", {})
keymap('n', '<leader>ca', "<cmd>lua vim.lsp.buf.code_action()<cr>", {})
keymap('n', '<leader>e', "<cmd>lua vim.diagnostic.open_float()<cr>", {})
keymap('n', '[d', "<cmd>lua vim.diagnostic.goto_prev()<cr>", {})
keymap('n', ']d', "<cmd>lua vim.diagnostic.goto_next()<cr>", {})
keymap('n', '<leader>q', "<cmd>lua vim.diagnostic.setloclist()<cr>", {})
keymap('n', '<leader>f', "<cmd>lua vim.lsp.buf.formatting()<cr>", {})

-- Menu
keymap('n', '<C-n>', ":NvimTreeToggle<CR>", {})

-- Git
keymap('n', '<leader>gg', ":Git<CR>", {})
keymap('n', '<leader>gc', ":Git commit<CR>", {})
