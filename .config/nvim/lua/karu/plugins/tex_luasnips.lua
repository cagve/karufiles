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

local rec_ls
rec_ls = function()
	return sn(nil, {
		c(1, {
			t({""}),
			sn(nil, {t({"", "\t\\item "}), i(1), d(2, rec_ls, {})}),
		}),
	});
end

local snippets = {
	s("en", {
		t({"\\begin{enumerate}",
		"\t\\item "}), i(1), d(2, rec_ls, {}),
		t({"", "\\end{enumerate}"}), i(0)
	}),
	s("ls", {
		t({"\\begin{itemize}",
		"\t\\item "}), i(1), d(2, rec_ls, {}),
		t({"", "\\end{itemize}"}), i(0)
	}),
	s("mm", c(1,{t"hola", t"adios"})),
	s("im", fmt("${}$ {}", { i(1), i(2) })),
	s("bf", fmt("\\textbf{{{}}} {}", { i(1), i(2) })),
	s("it", fmt("\\textit{{{}}} {}", { i(1), i(2) })),
	s("dm", fmt("\\[\n{}\n\\]\n {}", { i(1), i(2) })),
	s("sec", fmt("\\section{{{}}}\n{}", { i(1), i(2) })),
	s("sub", fmt("\\subsection{{{}}}\n{}", { i(1), i(2) })),
	s("ssub", fmt("\\subsubsection{{{}}}\n{}", { i(1), i(2) })),
	s("ff", fmt( [[
		\begin{{frame}} \frametitle{{{}}}
			{}
		\end{{frame}}
		]], { i(1), i(2) }
		)
	),
	s("beg", fmt( [[ 
		\begin{{{}}}
			{}
		\end{{{}}}
	]], { i(1), i(2), rep(1) }
		)
	),
	s("template", fmt(
		"{}",
		c(1, {
			f(function()
				return require("karu.utils").get_latex_templates()[1]
			end),
			f(function()
				return require("karu.utils").get_latex_templates()[2]
			end),
		})
		)
	)
}

ls.add_snippets("tex", snippets)
