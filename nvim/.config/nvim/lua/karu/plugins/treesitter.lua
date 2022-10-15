-- Tree-sitter configuration
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {"latex"},
    additional_vim_regex_highlighting = {'org'}, -- Required for spellcheck, some LaTex highlights and code block highlights that do not have ts grammar
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

