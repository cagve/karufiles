local compile = function ()
    if vim.bo.filetype == "tex" then
        local scripts = vim.api.nvim_exec(':VimtexStatus', true)
        if string.find(scripts, "not") then
            return ("")
        elseif vim.api.nvim_get_var('vimtex_quickfix_mode')==1 then
            return("")
        end
            return ("")
    else 
        return 
    end
end


require('lualine').setup {
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {compile,'progress'},
    lualine_z = {'location'}
  },
}

