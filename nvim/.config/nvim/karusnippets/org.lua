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

return {
	s({trig="rr"}, fmt( [[ {}
    #+TITLE: {}
    #+AUTHOR: {}
    #+PDF: ~/Phd/Database/Papers/{}
    #+TEX: ~/Phd/Readings/{}
	]], { 
        i(1),
        rep(1),
        i(2),
		f(function(args, _)
            local lol = args[1][1]
            local h = lol:gsub(" ", "_")
			return h..".pdf"
		end, {1}),
		f(function(args, _)
            local lol = args[1][1]
            local h = lol:gsub(" ", "_")
			return h..".tex"
		end, {1}),
    }))
}
