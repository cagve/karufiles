local writers = vim.api.nvim_create_augroup("writerGroups", {clear = true})
local set = vim.opt

local writersGroupSettings = function()
    set.spelllang="en"
    set.spell=true
    set.autoread=true							-- When a file has been detected to have been changed outside of Vim automatically read it again.
    set.wrap=true								-- Avoid show 1 long line--
    set.linebreak=true                           -- Prevents words from breaking over line
    set.breakindent=true                         -- Indent wrapped lines
    -- let.&showbreak='  '                   -- Indent amount
    -- set.iskeyword+='-'                      	-- treat dash separated words as a word text object--
    set.encoding='UTF-8'                      -- The encoding displayed 
    set.fileencoding='utf-8'                  -- The encoding written to file
    set.conceallevel=0                      -- So that I can see `` in markdown files
    set.cursorline=true                          -- Enable highlighting of the current line
end

vim.api.nvim_create_autocmd("BufEnter", {pattern = {"*.org","*.tex", "*.md"}, callback = writersGroupSettings , group = writers})


