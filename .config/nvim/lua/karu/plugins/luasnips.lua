local ls = require"luasnip"
local s = ls.snippet
-- local sn = ls.snippet_node
-- local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
-- local f = ls.function_node
-- local c = ls.choice_node
-- local d = ls.dynamic_node
-- local r = ls.restore_node
-- local events = require("luasnip.util.events")
-- local ai = require("luasnip.nodes.absolute_indexer")


ls.config.set_config{
	history = true,
	updateevents = 'TextChanged,TextChangedI',
	enable_autosnippets = true
}

ls.snippets = {
	all = {
	},
	latex = {
		s("bf", {t("\\textbf{"),i(1, "texto en negrita"),t("}")}),
		s("it", {t("\\textit{"),i(1, "texto en negrita"),t("}")}),
		s("im", {t("$"),i(1, "texto en negrita"),t("$")}),
		s("dm", {t("\\[ \n"),i(1, "texto en negrita"),t("\\]")})
	},
	vimwiki = {
		s("bf", {t("**"),i(1, "text"),t("**")}),
		s("it", {t("*"),i(1, "text"),t("*")}),
	},
	markdown = {
		s("bf", {t("**"),i(1, "text"),t("**")}),
		s("it", {t("*"),i(1, "text"),t("*")}),
	}
}

