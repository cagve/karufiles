local set = vim.opt
local api = vim.api

vim.g.mapleader=" "
set.title=true
set.errorbells=false
set.tabstop=4 
set.softtabstop=4
set.shiftwidth=4
set.relativenumber=true
set.nu=true
set.hlsearch=false
set.smartindent=true
set.autoindent=true
set.backup=false
set.undodir="/home/karu/.config/nvim/undodir/"
set.undofile=true
set.spell=false
set.wrap=false
set.termguicolors=true
set.incsearch=true
set.scrolloff=8
set.hidden=true

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'nvim_treesitter#foldexpr()'


api.nvim_set_var("latex_template","/home/karu/Documents/LaTeX/templates")
vim.cmd("colorscheme gruvbox")
vim.cmd("set rtp+=/home/karu/texbox")
vim.cmd("set rtp+=/home/karu/Bitacora")
