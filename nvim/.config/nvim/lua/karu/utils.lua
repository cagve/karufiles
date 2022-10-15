local M = {}
local ls = require"luasnip"
local q = require('vim.treesitter.query')
local api = vim.api
local ts_utils = require'nvim-treesitter.ts_utils'


M.check_backspace = function ()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

M.luasnip_expands = function ()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end

M.luasnip_prev_jump = function ()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end

M.luasnip_change = function ()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end

M.get_latex_templates = function ()
    local directory = api.nvim_get_var("latex_template")
    local i, files, popen = 0, {}, io.popen
    local pfile = popen('ls "'..directory..'"')
    for filename in pfile:lines() do
        i = i + 1
        files[i] = filename
    end

    local contents, j = {}, 0
    for _, filename in pairs(files) do
        local lines = {}
        j = j + 1
        local file = directory.."/"..filename
        local f = io.open(file, "r")
        for line in io.lines(file) do
            lines[#lines + 1] = line
        end
        contents[j] = lines
        f:close()
    end
    return contents
end

-- ORG: First Section
M.get_first_section = function ()
    local querystr = "(section) @section"
	local parser = vim.treesitter.get_parser(0, "org")
	local tree = parser:parse()[1]
	local root = tree:root()
	local query = vim.treesitter.parse_query('org', querystr)
	local result = {}
	local counter = 1
	for _,match,_ in query:iter_matches(root,0, 0, -1) do
		for _, node in pairs(match) do
			result[counter] = node
			counter = counter+1
		end
	end
    local node = result[1]
    local text = q.get_node_text(node,0)
    local start_row, _, end_row, _ = vim.treesitter.get_node_range(node)
    return node, text, {start_row, end_row}
end

M.get_last_section = function ()
    local querystr = "(section) @section"
	local parser = vim.treesitter.get_parser(0, "org")
	local tree = parser:parse()[1]
	local root = tree:root()
	local query = vim.treesitter.parse_query('org', querystr)
	local result = {}
	local counter = 1
	for _,match,_ in query:iter_matches(root,0, 0, -1) do
		for _, node in pairs(match) do
			result[counter] = node
			counter = counter+1
		end
	end
    local node = result[#result]
    local text = q.get_node_text(node,0)
    local start_row, _, end_row, _ = vim.treesitter.get_node_range(node)
    return node, text, {start_row, end_row}
end
-- ORG 
M.section_node_in = function ()
    local node = ts_utils.get_node_at_cursor()
    local first_node,_,first_range = M.get_first_section()
    local start_row = first_range[1]

    local row = vim.api.nvim_win_get_cursor(0)[1]
    if row < start_row then
        node = first_node
    else
        while node:type() ~= 'section' or node:parent():type()~='document' do
            node = node:parent()
        end
    end
    local node_text = q.get_node_text(node,0)
    local start_row, _, end_row, _ = vim.treesitter.get_node_range(node)
    return node, node_text, {start_row, end_row}
end

M.goto_next_section = function ()
    local first_node,_,first_range = M.get_first_section()
    local start_row_first = first_range[1]

    local _,_,last_range = M.get_last_section()
    local start_row_last = last_range[1]

    local current_node,_ ,_ = M.section_node_in()
    local node = current_node:next_sibling()
    local row = vim.api.nvim_win_get_cursor(0)[1]

    if row < start_row_first or row >= start_row_last then
        node = first_node
    end
    local start_row, start_col, _, _ = vim.treesitter.get_node_range(node)
    vim.api.nvim_win_set_cursor(0,{start_row+1, start_col})
end

M.goto_prev_section = function ()
    local _,_,first_range = M.get_first_section()
    local start_row_first = first_range[1]

    local last_node,_,_ = M.get_last_section()

    local current_node,_ ,_ = M.section_node_in()
    local node = current_node:prev_sibling()
    local row = vim.api.nvim_win_get_cursor(0)[1]

    if row <= start_row_first then
        node = last_node
    end
    local start_row, start_col, _, _ = vim.treesitter.get_node_range(node)
    vim.api.nvim_win_set_cursor(0,{start_row+1, start_col})
end

M.extract_section = function ()
    local node, node_text, range = M.section_node_in()
    local text = {}
    for s in string.gmatch(node_text, "[^\r\n]+") do
        table.insert(text,s)
    end

    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf,"TEST")
    vim.api.nvim_buf_set_option(buf,"filetype", "org")
    vim.api.nvim_buf_attach(buf, false, {})
    vim.api.nvim_buf_set_option(buf,'filetype', 'org')
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, text)
    vim.api.nvim_win_set_buf(0,buf)

    local start_row = range[1]
    local end_row = range[2]
    vim.api.nvim_buf_set_keymap(buf,'n','<C-c>', ':lua require("karu.utils").quit_saving('..buf..','..start_row..','..end_row..')<CR>', {})
end

M.quit_saving = function (buf, start_row, end_row)
    local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)
    vim.api.nvim_buf_delete(0, {})
    vim.api.nvim_buf_set_lines(0, start_row, end_row,false, {})
    vim.api.nvim_buf_set_lines(0, start_row, start_row,false, lines)
end 

return M
