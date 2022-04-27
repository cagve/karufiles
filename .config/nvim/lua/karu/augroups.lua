local writers = vim.api.nvim_create_augroup("writerGroups", {clear = true})

local writersGroup = function()
	print("Hello writer!")
	print("You are amazing!")
end

vim.api.nvim_create_autocmd("BufEnter", {pattern = {"*.tex", "*.md"}, callback = writersGroup , group = writers})
