-- Two common LuaSnip abbreviations
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node

local snippet = {
	s({trig="diary"}, fmt([[
	# {}

	## Daily checklist

	## Notes

	## Diary
	]], { f(function () return os.date("(%a) %d/%b/%Y") end)})),
}


return snippet

