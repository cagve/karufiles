local ls = require"luasnip"

local function send_tmux_command()
	local command = vim.fn.input("¿Qué comando quieres enviar a tmux? > ")
	vim.api.nvim_buf_set_keymap(0, 'n', '<leader>p', ':!tmux send-keys -t 2 '..command..' enter<cr>', {silent = true})
end

local function luasnip_expands()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end

local function luasnip_prev_jump()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end


return {
	send_tmux_command = send_tmux_command,
	luasnip_expands = luasnip_expands,
	luasnip_prev_jump = luasnip_prev_jump
}

