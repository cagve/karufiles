-- Two common LuaSnip abbreviations
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node

local function redefined_command (command)
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for _,line in ipairs(lines) do
		local pattern = "newcommand{.-}.-{"..command.."}" -- Se puede mejorar unificando regex
		if string.find(line, pattern) then
			return line:match("{(.-)}")
		end
	end
	return command
end

local snippet = {
	s("today", {
		c(1, {
			f(function () return os.date("(%a) %d/%b/%Y") end),
			f(function () return os.date("%d/%b/%Y") end),
			f(function () return os.date("(%a) %d/%b/%Y %H:%M") end),
		}),
		t" ",
		i(2)
		}
	),
}

return snippet

