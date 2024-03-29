local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<S-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, bufopts)
	vim.keymap.set("n", "E", function() vim.lsp.buf.signature_help() end, bufopts)
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require 'lspconfig'.sumneko_lua.setup {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' }
			}
		}
	}
}

require'lspconfig'.pyright.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

require 'lspconfig'.texlab.setup {
	on_attach = on_attach,
	capabilities = capabilities
}

require'lspconfig'.rust_analyzer.setup{
	on_attach = on_attach,
	capabilities = capabilities
}

-- require'lspconfig'.ltex.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	cmd = {"/home/caguiler/Downloads/g/ltex-ls-15.2.0/bin/ltex-ls"}
-- }
