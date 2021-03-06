require('karu.settings') -- ~/.config/nvim/lua/settings.lua
require('karu.mappings') -- ~/.config/nvim/lua/mappings.lua
require('karu.utils')    -- ~/.config/nvim/lua/utils.lua
require('karu.augroups') -- ~/.config/nvim/lua/augroups.lua

require('karu.plugins.autopairs')  -- ~/.config/nvim/lua/plugins/autopairs
require('karu.plugins.cmp')        -- ~/.config/nvim/lua/plugins/cmp
require('karu.plugins.lualine')    -- ~/.config/nvim/lua/plugins/lualine
require('karu.plugins.telescope')  -- ~/.config/nvim/lua/plugins/telescope
require('karu.plugins.treesitter') -- ~/.config/nvim/lua/plugins/treesitter
require('karu.plugins.vimwiki')    -- ~/.config/nvim/lua/plugins/vimwiki
require('luasnip.loaders.from_lua').load({paths = "~/.config/nvim/karusnippets"})


