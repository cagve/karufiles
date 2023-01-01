local set = vim.opt
local api = vim.api

vim.g.mapleader=" "
set.title=true
set.hidden=true
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
set.incsearch=true
set.pumheight=20                        -- Makes popup menu entry smaller
set.autoread=true
set.expandtab=true                      -- Converts tabs to spaces
set.smarttab=true                       -- Makes tabbing smarter will realize you have 2 vs 4
set.autoindent=true                     -- Good auto indent
set.smartindent=false					-- prevents extra indenting 
set.scrolloff=8

api.nvim_set_var("latex_template","/home/karu/Documents/LaTeX/templates")

vim.cmd("autocmd FileType netrw setl bufhidden=wipe") -- permit toggle netrw
vim.cmd("set rtp+=/home/karu/texbox")
vim.cmd("set rtp+=/home/karu/ProjectManager")
