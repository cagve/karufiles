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

local node = function(_, snip)
	return "node(n"..snip.captures[1]..")"
end

local snippet = {
}




-- TODO: Calback options and children :h luasnip-here

return snippet, autosnippet
