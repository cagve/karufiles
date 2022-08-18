local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node
local r = ls.restore_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node

local date = function() return {os.date('%Y-%m-%d')} end


ls.config.set_config({
	history = true,
	enable_autosnippets = true
})

local snippet = {
	s({
		trig = "date",
		namr = "Date",
		dscr = "Date in the form of YYYY-MM-DD",
	}, {
		f(date, {}),
	}),
}

return snippet
