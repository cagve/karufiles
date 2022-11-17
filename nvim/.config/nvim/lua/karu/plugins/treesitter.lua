-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"latex"},
  },
}

require('spellsitter').setup()
