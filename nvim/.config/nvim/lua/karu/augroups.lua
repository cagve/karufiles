local keymap = vim.api.nvim_set_keymap
local opts = {noremap = true}

local writers = vim.api.nvim_create_augroup("writerGroups", {clear = true})
local epistemictree = vim.api.nvim_create_augroup("epistemictree", {clear = true})
local set = vim.opt

local writersGroupSettings = function()
    set.spelllang="en"                      --
    set.spell=true                          -- 
    set.wrap=true							-- Avoid show 1 long line--
    set.linebreak=true                      -- Prevents words from breaking over line
    set.breakindent=true                    -- Indent wrapped lines
    set.encoding='UTF-8'                    -- The encoding displayed 
    set.fileencoding='utf-8'                -- The encoding written to file
    set.conceallevel=0                      -- So that I can see `` in markdown files
    set.cursorline=true                     -- Enable highlighting of the current line
    keymap('i', '<C-u>', '<c-g>u<Esc>[s1z=`]a<c-g>u', opts)
end

local epistemictreeGroupSettings = function ()
    keymap('n', '<leader>r', ':!python3 -m epistemictree <CR>' , opts)
    keymap('n', '<leader>t', ':!python3 -m epistemictree -f "p" -s "k" -t <CR>' , opts)
end


vim.api.nvim_create_autocmd("BufEnter", {pattern = {"neomutt-*","*.tex", "*.md"}, callback = writersGroupSettings , group = writers})
vim.api.nvim_create_autocmd("BufEnter", {pattern = {"/home/karu/epistemic-tree/*.py"}, callback = epistemictreeGroupSettings , group = epistemictree})

