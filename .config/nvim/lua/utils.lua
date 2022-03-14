local function send_tmux_command()
	local command = vim.fn.input("¿Qué comando quieres enviar a tmux? > ")
	vim.api.nvim_buf_set_keymap(0, 'n', '<leader>p', ':!tmux send-keys -t1 '..command..' enter<cr>', {silent = true})
end

return {
	send_tmux_command = send_tmux_command
}

