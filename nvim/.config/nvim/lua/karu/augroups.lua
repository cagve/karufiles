local writers = vim.api.nvim_create_augroup("writerGroups", {clear = true})
local tfm = vim.api.nvim_create_augroup("tfmGroups", {clear = true})

local writersGroupSettings = function()
	vim.opt.spell=true
	vim.opt.spelllang='es'
	vim.opt.textwidth=80
	vim.opt.conceallevel=2
	vim.opt.concealcursor='c'
	vim.api.nvim_set_keymap('n','\\r',':!drae <cword><CR>',{})
	vim.api.nvim_set_keymap('i','<C-u>','<c-g>u<Esc>[s1z=`]a<c-g>u',{})
	vim.api.nvim_set_keymap('v','\\i','c\\textit{<Esc>pa}<Esc>',{}) -- Reg: di\textit{pa}
	vim.api.nvim_set_keymap('v','\\b','c\\textbf{<Esc>pa}<Esc>',{}) -- Reg: di\textbf{pa}
	vim.api.nvim_set_keymap('v','\\c',"c``<Esc>pa''<Esc>",{}) -- Reg: di\textit{pa}
	vim.api.nvim_set_keymap('n','\\w',":VimtexCountWords<CR>",{}) -- Reg: di\textit{pa}
	vim.api.nvim_set_keymap('v','<leader>r', "d<CR>:lua require('texbox.tree').run_tree()<CR>",{})
end

local tfmGroupSetting = function ()
	vim.api.nvim_set_keymap('n','<F5>',':!python3 /home/karu/epistemic-tree/epistemic-tree/__init__.py',{})
	vim.api.nvim_set_keymap('n','<F9>',':!python3 ~/epistemic-tree/epistemic-tree/__init__.py && dot -Tpng ~/epistemic-tree/lib/dots/graph_test.dot > ~/test.png<CR>',{})
	vim.api.nvim_set_keymap('n','<F10>',':!python3 ~/epistemic-tree/epistemic-tree/test.py',{})
end

vim.api.nvim_create_autocmd("BufEnter", {pattern = {"*.tex", "*.md"}, callback = writersGroupSettings , group = writers})
vim.api.nvim_create_autocmd("BufEnter", {pattern = {"/home/karu/epistemic-tree/*.py"}, callback = tfmGroupSetting , group = tfm})
