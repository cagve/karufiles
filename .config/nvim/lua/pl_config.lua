local M = {}


-- Vim wiki
vim.g.vimwiki_list = {{path = '/home/karu/vimwiki', syntax = 'markdown', ext = '.md'}}
-- vim.highlight.create('VimwikiHeader1',{ guifg='#cc241d'},false)
-- vim.highlight.create('VimwikiHeader2',{ guifg='#d79921'}, false)
-- vim.highlight.create('VimwikiHeader3',{ guifg='#458588'}, false)
-- vim.highlight.create('VimwikiHeader4',{ guifg='#689d6a'}, false)
-- vim.highlight.create('VimwikiHeader5',{ guifg='#00FFFF'}, false)
-- vim.highlight.create('VimwikiHeader6',{ guifg='#FFFF00'}, false)

-- COMPLETION PLUGINS
-- vim.cmd [[packadd packer.nvim]]
local cmp = require('cmp')
cmp.setup{
	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'ultisnips' },
		{ name = 'buffer' },
		{ name = 'path'},
		{ name = 'nvim_lua'},
	})
}

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
cmp_autopairs.lisp[#cmp_autopairs.lisp+1] = "racket"
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.rust_analyzer.setup{capabilities = capabilities}
require'lspconfig'.texlab.setup{capabilities = capabilities}
require'lspconfig'.sumneko_lua.setup{capabilities = capabilities}


-- AUTOPAIRS PLUGINS
require('nvim-autopairs').setup{}

-- TELESCOPE PLUGINS
require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'},
			file_ignore_patterns = discard_file_type,
			grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
			prompt_prefix   = " ",
			path_display = { 'absolute', 'shorten'},
			selection_caret = "> ",
			entry_prefix    = "  ",
			initial_mode    = "insert",
			layout_strategy = "horizontal",
			file_sorter =  require'telescope.sorters'.get_fuzzy_file,
			border = {},
			borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			color_devicons = true,
	}
}

M.grep = function()
	require('telescope.builtin').live_grep({
		file_ignore_patterns = discard_file_type,
	})
end

-- TREESITTER PLUGIN
require'nvim-treesitter.configs'.setup {
	highlight = {
		enable = true,
	},
	playground = {
		enable = true,
		disable = {},
		updatetime = 25, 
		persist_queries = false, 
		keybindings = {
			toggle_query_editor = 'o',
			toggle_hl_groups = 'i',
			toggle_injected_languages = 't',
			toggle_anonymous_nodes = 'a',
			toggle_language_display = 'I',
			focus_language = 'f',
			unfocus_language = 'F',
			update = 'R',
			goto_node = '<cr>',
			show_help = '?',
		},
	}
}

-- STATUS LINE
require'lualine'.setup{}
