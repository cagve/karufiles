require('karu.settings')
require('karu.mappings')
require('karu.plugins')
require('karu.utils')

require('karu.plugins.autopairs')
require('karu.plugins.cmp')
require('karu.plugins.lualine')
require('karu.plugins.telescope')
require('karu.plugins.treesitter')
require('karu.plugins.vimwiki')

require('luasnip.loaders.from_lua').load({paths = "~/.config/nvim/karusnippets"})

