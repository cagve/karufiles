local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local utils = require('karu.utils')

local tex = {}

local snippets = {
	-- MATH MODE
	s({trig="<>"}, fmt("\\langle {} \\rangle {}", {i(1), i(2)}),{condition = tex.is_math}),
	s({trig="{}"}, fmt("\\{{{}\\}} {}", {i(1), i(2)}), {condition = tex.is_math}),
	s({trig="text"}, fmt("\\text{{{}}} {}", {i(1), i(2)}), {condition = tex.is_math}),
	s({trig="len"}, c(1, {fmt("\\mathcal{{L}}_{{{}}} {}", {i(1), i(2)}),fmt("\\mathcal{{L}} {} ", {i(1)})}),  {condition = tex.is_math}),
	s({trig="tt"}, {t("\\text{ \\texttt{"), i(1), t("}}"), i(2)}, {condition=tex.is_math}),


}
return snippets
