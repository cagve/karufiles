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

ls.config.set_config({
	history = true,
	enable_autosnippets = true
})

-- It's possible to use capture-groups inside regex-triggers.

local snippet = {
	s("ww", {
		t"\\node(w", i(1,"name"), t")",
		d(2, function(args)
			return sn(nil, {
				t"[label=",
				i(1),
				t":",
				t("$w_"..args[1][1].."$")
			})
		end,
		{1}),
		c(3,{
			t"]",
			sn(nil, {
				t", ",
				i(1, " position "),
				t" = ",
				i(2),
				t"cm of ",
				i(3),
				t"]",
			})
		}),
		t"{",
		i(4);
		t"};"
	}),
	s({trig="w(%d)", regTrig = true }, {
		t"\\node(w",
		f(function(_, snip)
				return snip.captures[1]
		end, {}),
		t")",
		d(2, function(args)
			return sn(nil, {
				t"[label=",
				i(1),
				t":",
				t("$w_"..args[1][1].."$")
			})
		end,
		{},{"hola"}),
		c(3,{
			t"]",
			sn(nil, {
				t", ",
				i(1, " position "),
				t" = ",
				i(2),
				t"cm of ",
				i(3),
				t"]",
			})
		}),
		t"{",
		i(4);
		t"};"
	})
}






-- TODO: Calback options and children :h luasnip-here

return snippet, autosnippet
