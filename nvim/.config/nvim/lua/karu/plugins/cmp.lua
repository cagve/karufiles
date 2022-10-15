local cmp = require('cmp')
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}

cmp.setup{
	snippet = {
		expand = function(args)
			require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				buffer = "[Buf]",
				path = "[Path]"
			})[entry.source.name]
			return vim_item
		end
	},
	mapping = {
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.close(),
		['<C-n>'] = cmp.mapping.select_next_item(),
		['<C-b>'] = cmp.mapping.select_prev_item(),
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'orgmode' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path'},
		{ name = 'nvim_lua'},
	})
}

require("nvim-autopairs").setup {}
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
cmp.event:on(
  'confirm_done',
  cmp_autopairs.on_confirm_done()
)

require'lspconfig'.rust_analyzer.setup{capabilities = capabilities}
require'lspconfig'.cssls.setup { capabilities = capabilities}
require'lspconfig'.gopls.setup { capabilities = capabilities}
require'lspconfig'.texlab.setup{capabilities = capabilities}
require'lspconfig'.pyright.setup{capabilities = capabilities}
require'lspconfig'.sumneko_lua.setup{
	capabilities = capabilities,
	settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

