require('nvim-autopairs').setup{}

if vim.bo.filetype=="tex" then
	require('nvim-autopairs').remove_rule('"')
end
