local M = {}

M.quickfix_toggle = function ()
    local quick_status = vim.api.nvim_get_var('vimtex_quickfix_mode')
    if quick_status == 0 then
        vim.api.nvim_set_var('vimtex_quickfix_mode', 1)
    else 
        vim.api.nvim_set_var('vimtex_quickfix_mode', 0)
    end
end

return M
