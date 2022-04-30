local writers = vim.api.nvim_create_augroup("writerGroups", {clear = true})

local writersGroupSettings = function()
	vim.opt.spell=true
	vim.opt.spelllang='es'
	vim.opt.textwidth=80
	vim.opt.conceallevel=2
	vim.opt.concealcursor='c'
	vim.api.nvim_set_keymap('i','<C-u>','<c-g>u<Esc>[s1z=`]a<c-g>u',{})
end

vim.api.nvim_create_autocmd("BufEnter", {pattern = {"*.tex", "*.md"}, callback = writersGroupSettings , group = writers})
