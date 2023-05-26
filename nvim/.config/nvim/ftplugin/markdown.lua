-- Mapping
local function increase_header()
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	local header = '#'
	if string.sub(line, 1, 1) ~= '#' then
		header = '# '
	end
	local nline = header .. line
	vim.api.nvim_set_current_line(nline)
end

local function decrease_header()
	local pos = vim.api.nvim_win_get_cursor(0)[2]
	local line = vim.api.nvim_get_current_line()
	if string.sub(line, 1, 1) == '#' then
		local nline = line:sub(2)
		if string.sub(nline, 1, 1) == ' ' then
			nline = line:sub(3)
		end
		vim.api.nvim_set_current_line(nline)
	end
end

local function create_link()
	local line = vim.api.nvim_get_current_line()
	local vstart = vim.fn.getpos("'<")
	local vend = vim.fn.getpos(".")

	local col_start = vstart[3]
	local col_end = vend[3]
	local row_end = vend[2]

	local nline = line:sub(1,col_start-1).."["..line:sub(col_start, col_end) .. "]()"..line:sub(col_end+1)
	vim.api.nvim_set_current_line(nline)
	vim.api.nvim_input('<esc>')

	local cur_pos = col_end +2
	vim.api.nvim_win_set_cursor(0,{row_end,cur_pos})
	vim.api.nvim_input('a')
end

vim.keymap.set('n', '=', increase_header)
vim.keymap.set('n', '+', decrease_header)
vim.keymap.set('v', '<C-space>', create_link)
vim.keymap.set('n', '<C-space>', 'ciw[]<esc>Pf]a()<esc>i' ) -- Create link to the current world. 
