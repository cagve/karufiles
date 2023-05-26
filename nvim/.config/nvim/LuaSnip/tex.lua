-- Two common LuaSnip abbreviations
local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node
local rep = require("luasnip.extras").rep
local fmt = require("luasnip.extras.fmt").fmt
local t = ls.text_node

local function redefined_command (command)
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	for _,line in ipairs(lines) do
		local pattern = "newcommand{.-}.-{"..command.."}" -- Se puede mejorar unificando regex
		if string.find(line, pattern) then
			return line:match("{(.-)}")
		end
	end
	return command
end

local function is_math()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local snippet = {
	s({trig="im", name="Inline math mode"}, fmt("$ {} $ {}", {i(1), i(2)})),
	s({trig="dm", name="Display math mode"}, fmt("$$ {} $$ {}", {i(1), i(2)})),
	s({trig="bf", name="Bold font"}, {t"\\textbf{", i(1), t"}"}),
	s({trig="it", name="Italic font"}, {t"\\textit{", i(1), t"}"}),
	s({trig="sec", name="Section"}, fmt("\\section{{{}}}\n{}", { i(1), i(2) })),
	s({trig="par", name="Paragraph"}, fmt("\\paragraph{{{}}}\n{}", { i(1), i(2) })),
	s({trig="sub", name="Subsection"}, fmt("\\subsection{{{}}}\n{}", { i(1), i(2) })),
	s({trig="ssub", name="Subsubsection"}, fmt("\\subsubsection{{{}}}\n{}", { i(1), i(2) })),
	s({trig='sal', name="Salto"}, t("\\salto ")),
	s({trig="tikz"}, fmt( [[ 
		\begin{{figure}}[ht!]
			\centering
			\begin{{tikzpicture}}
				{}
			\end{{tikzpicture}}
			\caption{{{}}}
			\label{{{}}}
		\end{{figure}}
	]], { i(0), i(1), f(function (args) return "fig:"..args[1][1]:gsub(" ","_") end, {1}) }
		)
	),
	s({trig="beg"}, fmt( [[ 
		\begin{{{}}}
			{}
		\end{{{}}}
	]], { i(1), i(2), rep(1) }
		)
	),
	s({trig="ff"}, fmt( [[
		\begin{{frame}} \frametitle{{{}}}
			{}
		\end{{frame}}
		]], { i(1, "frame title"), i(2) }
		)
	),
	s({trig="bb"}, fmt( [[
		\begin{{block}}{{{}}}
			{}
		\end{{block}}
		]], { i(1, "block title"), i(2) }
		)
	),


	-- Math context
	s({trig="pa", name="parenthesis ()"}, {
		t"\\left( ",
		i(1),
		t" \\right) ",
		i(2)
	}, {condition=is_math}),
	s({trig="br", name="brackets {}"}, {
		c(1, {
			{f(function () return redefined_command("\\lbrace") end),
			t" ", i(1), t" ",
			f(function () return redefined_command("\\rbrace") end),
			t" ", i(2)},
			{t"\\left",
			f(function () return redefined_command("\\lbrace") end),
			t" ", i(1), t" ",
			t"\\right",
			f(function () return redefined_command("\\rbrace") end),
			t" ", i(2)},
		})
	}, {condition=is_math}),
	s({trig="an", name="angles <>"}, {
		f(function () return redefined_command("\\langle") end),
		t" ", i(1), t" ",
		f(function () return redefined_command("\\rangle") end),
		t" ", i(2)
	}, {condition=is_math}),
	s({trig="txt", name="Text in math mode"},
		{t("\\text{ "),
		i(1),
		t(" } "),
		i(2)
	}, {condition=is_math}),

	s({trig="tt", name="Text in math mode"},
		{t("\\mathtt{"),
		i(1),
		t("} "),
		i(2)
	}, {condition=is_math}),

	s({trig="iff", name="Iff in math mode"}, t"\\text{ iff } ", {condition=is_math});
	s({trig="all", name="Forall in math mode"}, t"\\text{ for all }",{condition=is_math}),

	s({trig="ex", name="∃"},
		fmt("{} ", f(function () return redefined_command("\\exists\\:") end)),
		{condition=is_math}
	),
	s({trig="fa", name="∀"},
		fmt("{} ", f(function () return redefined_command("\\forall\\:") end)),
		{condition=is_math}
	),
	s({trig="la", name="∧"},
		fmt("{} ", f(function () return redefined_command("\\land") end)),
		{condition=is_math}
	),
	s({trig="lo", name=" ∨ "},
		fmt("{} ", f(function () return redefined_command("\\lor")end)),
		{condition=is_math}
	),
	s({trig="lt", name="→"},
		fmt("{} ", f(function () return redefined_command("\\to")end)),
		{condition=is_math}
	),
	s({trig="le", name="↔"},
		fmt("{} ", f(function () return redefined_command("\\leftrightarrow")end)),
		{condition=is_math}
	),
	s({trig="ln", name="¬"},
		fmt("{} ", f(function () return redefined_command("\\lnot")end)),
		{condition=is_math}
	),
	s({trig="sb", name="⊆"},
		fmt("{} {}", {c(1,{
			f(function () return redefined_command("\\subseteq")end),
			f(function () return redefined_command("\\subset")end)}),
			i(2)}
		),
		{condition=is_math}
	),
}

local autosnippet = {
	-- MATH FONT
	s({trig="(%a)cc", regTrig = true }, {
		f(function(_, snip)
				return redefined_command("\\mathcal{"..snip.captures[1].."}")
		end, {}),
    }, {condition = is_math}),
	s({trig="(%a)bb", regTrig = true }, {
		f(function(_, snip)
				return redefined_command("\\mathbf{"..snip.captures[1].."}")
		end, {}),
    }, {condition = is_math}),
	s({trig="(%a)ff", regTrig = true }, {
		f(function(_, snip)
				return redefined_command("\\mathfrak{"..snip.captures[1].."}")
		end, {}),
    }, {condition = is_math}),
	s({trig="(%a)sf", regTrig = true }, {
		f(function(_, snip)
				return redefined_command("\\mathfrak{"..snip.captures[1].."}")
		end, {}),
    }, {condition = is_math}),
}



return snippet, autosnippet

