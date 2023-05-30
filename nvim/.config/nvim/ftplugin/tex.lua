require('nvim-autopairs').remove_rule('"')

local function toogle_quickfix()
	local state = vim.api.nvim_get_var('vimtex_quickfix_enabled')
	if state==1 then
		vim.api.nvim_set_var('vimtex_quickfix_enabled', 0)
		vim.cmd "VimtexReload"
		print("Quicfix disabled")
	else
		vim.api.nvim_set_var('vimtex_quickfix_enabled', 1)
		vim.cmd "VimtexReload"
		print("Quicfix enabled")
	end
end

vim.keymap.set('n','<C-t>', '<plug>(vimtex-toc-toggle)')
vim.keymap.set('n','<C-p>', '<plug>(vimtex-view)')
vim.keymap.set('n','<localleader>le', 'vae<plug>(vimtex-compile-selected)')
vim.keymap.set('n','<localleader>lp', 'vap<plug>(vimtex-compile-selected)')
vim.keymap.set('n','<localleader>lt', '<plug>(vimtex-errors)')
vim.keymap.set('n','<localleader>qf', toogle_quickfix )
vim.keymap.set('n','dsm', 'ds$')
vim.keymap.set('v','<localleader>i', 'c\\textit{<Esc>pa}<Esc>')
vim.keymap.set('v','<localleader>b', 'c\\textbf{<Esc>pa}<Esc>')


vim.api.nvim_set_hl(0, "Conceal", {fg="orange"})

local function toggle_grammarly()
	local client = vim.lsp.get_active_clients({bufnr=0, name="grammarly"})
	local global_client = vim.lsp.get_active_clients({name="grammarly"})
	local id = global_client[1]["id"]
	if next(client) == nil then
		vim.lsp.buf_attach_client(0,id)
		print("Attached")
	else
		print("YES")
		vim.lsp.buf_detach_client(0,id)
		print("Detached")
   end
end

local function lsp_to_quickfix()
	-- print(vim.lsp.get_active_clients(name="grammarly"))
end
vim.keymap.set('n','<localleader>gg', toggle_grammarly )
vim.keymap.set('n','<localleader>gq', lsp_to_quickfix )
