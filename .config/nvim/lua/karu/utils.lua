local M = {}
local ls = require"luasnip"
local api = vim.api


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

return M
