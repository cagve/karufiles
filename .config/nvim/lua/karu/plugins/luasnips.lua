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

ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	enable_autosnippets = true,
})

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			t({ "" }),
			sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
		}),
	})
end

local function dyn_tab(pos)
	return d(pos, function (args)
		local j = 1
		local nodes = {}
		local str = args[1][1]:gsub("%s+", "")
		local size = string.len(str)
		while (j<=size) do
			if j == 1 then
				table.insert(nodes, i(j))
			else
				table.insert(nodes, t(" & "))
				table.insert(nodes, i(j))
			end
			j=j+1
		end
		return sn(nil,nodes)
	end,{1})
end

ls.snippets = {
	all = {
		s("tab",
			fmt( [[ 
			\begin{{tabular}}[{}]
				{}
			\end{{tabular}} ]],{
				i(1),
				dyn_tab(2)}))
	},
	vimwiki = {
		s("bf", { t("**"), i(1, "text"), t("**") }),
		s("it", { t("*"), i(1, "text"), t("*") }),
	},
	markdown = {
		s("bf", { t("**"), i(1, "text"), t("**") }),
		s("it", { t("*"), i(1, "text"), t("*") }),
	},
	lua = {
		s("pr", fmt("print({})", i(1))),
		s("ins", fmt("print(vim.inspect({}))", i(1))),
	},
}

require("karu.plugins.tex_luasnips")
