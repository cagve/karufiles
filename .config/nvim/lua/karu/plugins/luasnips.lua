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


ls.snippets = {
	all = {

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

