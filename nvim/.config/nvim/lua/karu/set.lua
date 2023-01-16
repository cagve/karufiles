-- COLORS
function SetColor(color)
	color = color or "tokyonight"
	if color == "tokyonight" then
		vim.cmd.colorscheme(color)
	end
end

SetColor()
vim.opt.tabstop=4
vim.opt.softtabstop=4
vim.opt.shiftwidth=4
vim.opt.nu=true
vim.opt.relativenumber=true
vim.opt.hlsearch=false
vim.opt.smartindent=true
vim.opt.backup=false
vim.opt.undofile=true
vim.opt.undodir="/home/caguiler/.config/nvim/undodir/"
vim.opt.incsearch=true
vim.opt.scrolloff=8
vim.opt.compatible=false
vim.opt.termguicolors=true
vim.cmd("filetype plugin on")
vim.cmd("syntax on")
vim.cmd("set rtp+=~/texbox")

-- WRITTER SETUP
local writersGroupSettings = function()
    vim.opt.spelllang="en"
    vim.opt.spell=true
    vim.opt.wrap=true							-- Avoid show 1 long line--
    vim.opt.linebreak=true                      -- Prevents words from breaking over line
    vim.opt.breakindent=true                    -- Indent wrapped lines
    vim.opt.encoding='UTF-8'                    -- The encoding displayed 
    vim.opt.fileencoding='utf-8'                -- The encoding written to file
    vim.opt.conceallevel=2                      -- So that I can see `` in markdown files
    vim.opt.cursorline=true                     -- Enable highlighting of the current line
    vim.keymap.set('i', '<C-u>', '<c-g>u<Esc>[s1z=`]a<c-g>u', {}) -- Corrige
end

local writers = vim.api.nvim_create_augroup("writerGroups", {clear = true})
vim.api.nvim_create_autocmd("BufEnter", {pattern = {"neomutt-*","*.tex", "*.md"}, callback = writersGroupSettings , group = writers})
