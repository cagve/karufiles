-- Hola mundo
require('karu.settings') -- ./lua/settings.lua
require('karu.mappings') -- ./lua/mappings.lua
require('karu.utils')    -- ./lua/utils.lua
require('karu.augroups') -- ./lua/augroups.lua

require('karu.plugins.autopairs')  -- ./lua/plugins/autopairs
require('karu.plugins.cmp')        -- ./lua/plugins/cmp
require('karu.plugins.lualine')    -- ./lua/plugins/lualine
require('karu.plugins.telescope')  -- ./lua/plugins/telescope
require('karu.plugins.treesitter') -- ./lua/plugins/treesitter
require('karu.plugins.vimwiki')    -- ./lua/plugins/vimwiki
require('luasnip.loaders.from_lua').load({paths = "~/.config/nvim/karusnippets"})


