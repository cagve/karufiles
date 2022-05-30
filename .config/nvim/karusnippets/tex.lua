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

local tex = {}

tex.is_math = function ()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local snippets = {
	-- LISTAS
	s({trig="en"}, {
		t({"\\begin{enumerate}",
		"\t\\item "}), i(1),
		t({"", "\\end{enumerate}"}), i(0)
	}),
	s({trig="ls"}, {
		t({"\\begin{itemize}",
		"\t\\item "}), i(1),
		t({"", "\\end{itemize}"}), i(0)
	}),

	-- MATH MODE
	s({trig="<>"}, fmt("\\langle {} \\rangle {}", {i(1), i(2)}),{condition = tex.is_math}),
	s({trig="{}"}, fmt("\\{{{}\\}} {}", {i(1), i(2)}), {condition = tex.is_math}),
	s({trig="text"}, fmt("\\text{{{}}} {}", {i(1), i(2)}), {condition = tex.is_math}),
	s({trig="iff"}, fmt("\\text{{ syss }} {}", {i(1)}), {condition = tex.is_math}),
	s({trig="len"}, c(1, {fmt("\\mathcal{{L}}_{{{}}} {}", {i(1), i(2)}),fmt("\\mathcal{{L}} {} ", {i(1)})}),  {condition = tex.is_math}),

	-- FORMATO TEXTO
	s({trig="color"}, fmt("{{ \\color{{{}}} {}}}", {i(1, "color"), i(2)})),
	s({trig="tt"}, {t("\\text{ \\texttt{"), i(1), t("}} "), i(2)}),
	s({trig="im"}, fmt("${}$ {}", { i(1), i(2) })),
	s({trig="bf"}, fmt("\\textbf{{{}}} {}", { i(1), i(2) })),
	s({trig="it"}, fmt("\\textit{{{}}} {}", { i(1), i(2) })),
	s({trig="dm"}, fmt("\\[\n{}\n\\]\n {}", { i(1), i(2) })),
	s({trig='"'},  fmt("``{}'' {}", { i(1), i(2)})),


	-- SECCIONES
	s({trig="sec"}, fmt("\\section{{{}}}\n{}", { i(1), i(2) })),
	s({trig="par"}, fmt("\\paragraph{{{}}}\n{}", { i(1), i(2) })),
	s({trig="sub"}, fmt("\\subsection{{{}}}\n{}", { i(1), i(2) })),
	s({trig="ssub"}, fmt("\\subsubsection{{{}}}\n{}", { i(1), i(2) })),

	s({trig='sal'}, t("\\salto")),
	-- BEAMER
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

	-- ENTORNOS
	s({trig="beg"}, fmt( [[ 
		\begin{{{}}}
			{}
		\end{{{}}}
	]], { i(1), i(2), rep(1) }
		)
	),

	-- TEMPLATES
	s({trig="template"},
		c(1, {
			fmt([[
			\documentclass[a4paper]{{article}}

			\usepackage{{natbib}} %bibliografia
			\usepackage{{hyperref}} %enlaces en el documento
			\usepackage{{amssymb}} %Simbolos matemáticos http://milde.users.sourceforge.net/LUCR/Math/mathpackages/amssymb-symbols.pdf
			\usepackage[spanish]{{babel}}%Español
			\usepackage[utf8]{{inputenc}}%utf8

			\newcommand{{\salto}}{{\par \medskip}}

			\title{{{}}}
			\author{{Carlos Aguilera Ventura}}
			\date{{\today}}

			\begin{{document}}
			\maketitle \tableofcontents
			{}
			\end{{document}}
			]], {i(1, "Title"),i(2)}),
			fmt([[
			\documentclass[a4paper]{{article}}

			\usepackage{{natbib}} %bibliografia
			\usepackage{{hyperref}} %enlaces en el documento
			\usepackage{{amssymb}} %Simbolos matemáticos http://milde.users.sourceforge.net/LUCR/Math/mathpackages/amssymb-symbols.pdf
			\usepackage[spanish]{{babel}}%Español
			\usepackage[utf8]{{inputenc}}%utf8
			\usepackage{{tikz}} %Para dibujar esquemas http://www.actual.world/resources/tex/doc/TikZ.pdf
			\usepackage{{tcolorbox}}

			\usetikzlibrary{{positioning,arrows,calc,shapes,babel}} 
			\tikzset{{
				modal/.style={{>=stealth',shorten >=1pt,shorten <=1pt,auto,node distance=1.5cm,
				semithick}},
				world/.style={{circle,draw,minimum size=0.5cm,fill=gray!15}},
				point/.style={{circle,draw,inner sep=0.5mm,fill=black}},
				reflexive above/.style={{->,loop,looseness=7,in=120,out=60}},
				reflexive below/.style={{->,loop,looseness=7,in=240,out=300}},
				reflexive left/.style={{->,loop,looseness=7,in=150,out=210}},
				reflexive right/.style={{->,loop,looseness=7,in=30,out=330}}
			}}

			\newtheorem{{defi}}{{Definici\'on}}
			\newtheorem{{ej}}{{Ejercicio}}
			\newtheorem{{ex}}{{Ejemplo}}
			\newtheorem{{theorem}}{{Teorema}}

			\newcommand{{\salto}}{{\par \medskip}}

			\title{{{}}}
			\author{{Carlos Aguilera Ventura}}
			\date{{\today}}

			\begin{{document}}
			\maketitle \tableofcontents \newpage
			{}
			\end{{document}}
			]], {i(1, "Title"),i(2)}),
			fmt([[
			\documentclass{{beamer}}

			\usepackage{{natbib}} %bibliografia
			\usepackage{{hyperref}} %enlaces en el documento
			\usepackage{{amssymb}} %Simbolos matemáticos http://milde.users.sourceforge.net/LUCR/Math/mathpackages/amssymb-symbols.pdf
			\usepackage[spanish]{{babel}}%Español
			\usepackage[utf8]{{inputenc}}%utf8

			\newcommand{{\salto}}{{\par \medskip}}

			\title{{{}}}
			\author{{Carlos Aguilera Ventura}}
			\date{{\today}}

			\begin{{document}}
			\maketitle \tableofcontents
			{}
			\end{{document}}
			]], {i(1, "Title"),i(2)}),
		})),
}

return snippets
