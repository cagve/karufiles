local entry_display = require("telescope.pickers.entry_display")
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local conf = require("telescope.config").values
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local builtin = require('telescope.builtin')

local function math_symbols()
	builtin.symbols({
		sources = { 'math' },
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				local symbol = selection.display:match("%S+")
				os.execute("echo -n " .. symbol .. " | xclip -selection clipboard")
				vim.api.nvim_put({symbol}, "", true, true)
			end)
			return true
		end,
	})
end

local function phd_dirs	()
	local path = vim.fn.expand('%')
	local command = "fd . -t d -d 2"

	local lines = {}
	local file = io.popen(command)
	for line in file:lines() do
		table.insert(lines, line)
	end
    file:close()

	local picker = pickers.new({}, {
		prompt_title = "Phd",
		finder = finders.new_table{ results = lines},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				path = "."..path.."/"..selection[1]
				print("..")
				print("Openning "..selection[1])
				vim.cmd('cd '..path)
			end)
			return true
		end,
	}):find()
end

local function mail_adress(opts)
	local home = os.getenv("HOME")
	local temp = home.."/.abook/abookcsv"

	local lines = {}
	for line in io.lines(temp) do
		lines[#lines + 1] = line
	end
	local telescope_entry = {}
	for index, line in ipairs(lines) do
		local row = {}
		local fields = {}
		for field in line:gmatch('([^,]+)') do
			fields[#fields+1] = field
		end

		-- #"name","email","address","address2","city","state","zip","country","phone","workphone","fax","mobile","nick","url","notes","anniversary","groups","Custom1","Custom3","Custom5"
		row[1] = fields[1]:gsub('"', '')
		row[2] = fields[2]:gsub('"', '')
		row[3] = fields[13]:gsub('"', '')
		row[4] = fields[17]:gsub('"', '')
		telescope_entry[index] = row
		end
	print(vim.inspect(telescope_entry))

	local displayer = entry_display.create({
		separator = " ",
		items = {
			{ width = 40 },
			{ width = 40 },
			{ remaining = true },
		},
	})

	local make_display = function(entry)
		return displayer({
			entry.name,
			entry.mail,
			entry.group,
		})
	end
	opts = opts or {}
	pickers.new(opts, {
		prompt_title = "Abook",
		finder = finders.new_table {
			results = telescope_entry,
			entry_maker = function(entry)
				return {
					ordinal = entry[1] .. entry[2],
					display = make_display,

					name = entry[1],
					mail = entry[2],
					nick = entry[3],
					group = entry[4],
				}
			end
		},
		sorter = conf.generic_sorter(opts),
		attach_mappings = function(prompt_bufnr, _)
			--ADD functions to add and delete users
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				vim.api.nvim_put({selection.mail}, "", true, true)
			end)
			return true
		end,
	}):find()
	return telescope_entry
end


vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>rg', builtin.grep_string, {})

-- Custom
vim.keymap.set('n', '<leader>mm', math_symbols, {})
vim.keymap.set('n', '<leader>ab', mail_adress, {})
vim.keymap.set('n', '<leader>ph', phd_dirs, {})

