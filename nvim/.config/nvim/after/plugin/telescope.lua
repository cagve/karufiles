local actions      = require 'telescope.actions'
local action_state = require 'telescope.actions.state'


local builtin = require('telescope.builtin')
local function math_symbols()
	builtin.symbols({
		sources={'math'},
		attach_mappings = function(prompt_bufnr,map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local symbol = selection.display:match("%S+")
				os.execute("echo -n "..symbol.." | xclip -selection clipboard")
			end)
			return true
		end,
	})
end

vim.keymap.set('n','<leader>cc', math_symbols, {})
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>rg', builtin.grep_string, {})

