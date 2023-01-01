local ls = require("luasnip")
local t = ls.text_node
local i = ls.insert_node
local s = ls.snippet
local fmt = require("luasnip.extras.fmt").fmt


ls.add_snippets("vimwiki", {
    s("tt", {
        t("this is my awesome text snippet")
    }),
	s({trig="im"}, fmt("${}${}", { i(1), i(2) })),
	s({trig="bf"}, fmt("**{}** {}", { i(1), i(2) })),
	s({trig="it"}, fmt("*{}* {}", { i(1), i(2) })),
})

require("luasnip").filetype_extend("vimwiki", {"markdown"})
