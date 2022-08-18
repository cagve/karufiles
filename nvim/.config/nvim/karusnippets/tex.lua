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
local utils = require('karu.utils')

local tex = {}

local table_node
table_node= function(args)
	local tabs = {}
	local count
	-- count = tonumber(args[1][1] 
	table = args[1][1]:gsub("%s",""):gsub("|","")
	count = table:len()
	for j=1, count do
		local iNode
		iNode = i(j)
		tabs[2*j-1] = iNode
		if j~=count then
			tabs[2*j] = t" & "
		end
	end
	return sn(nil, tabs)
end

local rec
rec = function ()
	return sn(nil, {
		c(1, {
			t({""}),
			sn(nil, {t{"\\\\",""} ,d(1,table_node, {ai[1]}), d(2, rec, {ai[1]})})
		}),
	});
end

tex.is_math = function ()
	return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

local rec_grammar
rec_grammar = function ()
	return sn(nil, {
		c(1, {
			t({""}),
			sn(nil,{t" \\mid ",i(1), d(2, rec_grammar)})
		}),
	});
end

ls.config.set_config({
	history = true,
	enable_autosnippets=true
})

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
	s({trig='"'},  fmt("``{}'' {}", { i(1), i(2)})),

	-- MATH MODE
	s(
		{ trig = "([a-zA-Z])(%d)", regTrig = true },
		f(function(_, snip)
			return snip.captures[1] .."_".. snip.captures[2]
		end, {}),
		{condition=tex.is_math}
	),
	s(
		{ trig = "([a-zA-Z])(%d+)", regTrig = true },
		f(function(_, snip)
			return snip.captures[1] .."_{".. snip.captures[2].."}"
		end, {}),
		{condition=tex.is_math}
	),
	s({trig="<>"}, fmt("\\langle {} \\rangle {}", {i(1), i(2)}),{condition = tex.is_math}),
	s({trig="{}"}, fmt("\\{{{}\\}} {}", {i(1), i(2)}), {condition = tex.is_math}),
	s({trig="text"}, fmt("\\text{{{}}} {}", {i(1), i(2)}), {condition = tex.is_math}),
	s({trig="len"}, c(1, {fmt("\\mathcal{{L}}_{{{}}} {}", {i(1), i(2)}),fmt("\\mathcal{{L}} {} ", {i(1)})}),  {condition = tex.is_math}),
	-- Print grammar like p::= p | p \land q |
	s({trig="gr"}, {i(1), t{" ::= "}, i(2), d(3, rec_grammar,{})}, {condition=tex.is_math}),
	s({trig="tt"}, {t("\\text{ \\texttt{"), i(1), t("}}"), i(2)}, {condition=tex.is_math}),

	-- TIKZ PICTURE
	s({trig="tikz"}, fmt( [[
	\begin{{figure}}[ht!]
		\begin{{tikzpicture}}
			{}
		\end{{tikzpicture}}
		\caption{{{}}}
		\label{{fig:{}}}
	\end{{figure}}
	]], { i(2),  i(1), rep(2),}
		)
	),
	s({trig="w(%d)", regTrig = true }, {
		t"\\node[world](w",
		f(function(_, snip)
				return snip.captures[1]
		end, {}),
		t")",
		d(1, function(_, snip)
			return sn(nil, {
				t"[label=",
				i(1),
				t":",
				t("$w_"..snip.captures[1].."$")
			})
		end,
		{}),
		c(2,{
			t"]",
			sn(nil, {
				t", ",
				i(1, " position "),
				t" = ",
				i(2),
				t"cm of ",
				i(3),
				t"]",
			})
		}),
		t"{",
		i(3),
		t"};"
	}),

	-- FORMATO TEXTO
	s({trig="color"}, fmt("{{ \\color{{{}}} {}}}", {i(1, "color"), i(2)})),
	s({trig="tt"}, {t("\\texttt{"), i(1), t("} "), i(2)}),
	s({trig="im"}, fmt("${}$ {}", { i(1), i(2) })),
	s({trig="bf"}, fmt("\\textbf{{{}}} {}", { i(1), i(2) })),
	s({trig="it"}, fmt("\\textit{{{}}} {}", { i(1), i(2) })),
	s({trig="dm"}, fmt("\\[\n{}\n\\]\n {}", { i(1), i(2) })),


	-- SECCIONES
	s({trig="sec"}, fmt("\\section{{{}}}\n{}", { i(1), i(2) })),
	s({trig="par"}, fmt("\\paragraph{{{}}}\n{}", { i(1), i(2) })),
	s({trig="sub"}, fmt("\\subsection{{{}}}\n{}", { i(1), i(2) })),
	s({trig="ssub"}, fmt("\\subsubsection{{{}}}\n{}", { i(1), i(2) })),

	s({trig='sal'}, t("\\salto ")),
	s({trig='ver'}, {t("\\verb+"), i(1), t("+ "), i(2)}),
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
	s("tab", {
		t"\\begin{tabular}{",
		i(1,"0"),
		t{"}",""},
		d(2, table_node, {1}, {}),
		d(3, rec, {1}),
		t{"","\\end{tabular}"}
	}),
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
		-- Operators
		s({trig="la"}, t("\\land "), {condition = tex.is_math}),
		s({trig="lo"}, t("\\lor "), {condition = tex.is_math}),
		s({trig="lt"}, t("\\to "), {condition = tex.is_math}),
		s({trig="le"}, t("\\leftrightarrow "), {condition = tex.is_math}),
		s({trig="ln"}, t("\\lnot "), {condition = tex.is_math}),

}

local autosnippets = {
	s({trig="iff"}, fmt("\\text{{ syss }} {}", {i(1)}), {condition = tex.is_math}),

	-- EPISTEMIC LOGIC
	s(
		{ trig = "k([a-d])", regTrig = true },
		f(function(_, snip)
				return "K_"..snip.captures[1]
		end, {}),
		{condition = tex.is_math}
	),
	s(
		{ trig = "K([a-d])", regTrig = true },
		f(function(_, snip)
				return "\\hat{K}_"..snip.captures[1]
		end, {}),
		{condition = tex.is_math}
	),

	-- GREEKS LETTERS
	s({trig="aa"}, t("\\alpha "), {condition = tex.is_math}),
	s({trig="bb"}, t("\\beta "), {condition = tex.is_math}),
	s({trig="gg"}, t("\\gamma "), {condition = tex.is_math}),
	s({trig="GG"}, t("\\Gamma "), {condition = tex.is_math}),
	s({trig="dd"}, t("\\delta "), {condition = tex.is_math}),
	s({trig="DD"}, t("\\Delta "), {condition = tex.is_math}),
	s({trig="ee"}, t("\\varepsilon "), {condition = tex.is_math}),
	s({trig="zz"}, t("\\zeta "), {condition = tex.is_math}),
	s({trig="thh"}, t("\\theta "), {condition = tex.is_math}),
	s({trig="THH"}, t("\\Theta "), {condition = tex.is_math}),
	s({trig="ii"}, t("\\iota "), {condition = tex.is_math}),
	s({trig="kk"}, t("\\kappa "), {condition = tex.is_math}),
	s({trig="ll"}, t("\\lambda "), {condition = tex.is_math}),
	s({trig="LL"}, t("\\Lambda "), {condition = tex.is_math}),
	s({trig="muu"}, t("\\mu "), {condition = tex.is_math}),
	s({trig="nuu"}, t("\\nu "), {condition = tex.is_math}),
	s({trig="xx"}, t("\\chi "), {condition = tex.is_math}),
	s({trig="pii"}, t("\\pi "), {condition = tex.is_math}),
	s({trig="PII"}, t("\\Pi "), {condition = tex.is_math}),
	s({trig="roo"}, t("\\rho "), {condition = tex.is_math}),
	s({trig="tt"}, t("\\tau "), {condition = tex.is_math}),
	s({trig="uu"}, t("\\upsilon "), {condition = tex.is_math}),
	s({trig="UU"}, t("\\Upsilon "), {condition = tex.is_math}),
	s({trig="oo"}, t("\\omega "), {condition = tex.is_math}),
	s({trig="OO"}, t("\\Omega "), {condition = tex.is_math}),
	s({trig="ss"}, t("\\sigma "), {condition = tex.is_math}),
	s({trig="SS"}, t("\\Sigma "), {condition = tex.is_math}),
	s({trig="phh"}, t("\\varphi "), {condition = tex.is_math}),
	s({trig="PHH"}, t("\\Phi "), {condition = tex.is_math}),
	s({trig="pss"}, t("\\psi "), {condition = tex.is_math}),
	s({trig="PSS"}, t("\\Psi "), {condition = tex.is_math}),
	s({trig="ZZ"}, t("\\Zeta "), {condition = tex.is_math})
}

return snippets, autosnippets
