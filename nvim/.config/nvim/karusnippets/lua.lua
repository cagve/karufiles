local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node


return {
	s("pr", fmt("print({})", i(1))),
	s("ins", fmt("print(vim.inspect({}))", i(1)))
}


