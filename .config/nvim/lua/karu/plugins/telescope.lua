require('telescope').setup{
	defaults = {
		vimgrep_arguments = {
			'rg',
			'--color=never',
			'--no-heading',
			'--with-filename',
			'--line-number',
			'--column',
			'--smart-case'},
			file_ignore_patterns = discard_file_type,
			grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
			prompt_prefix   = " ",
			path_display = { 'absolute', 'shorten'},
			selection_caret = "> ",
			entry_prefix    = "  ",
			initial_mode    = "insert",
			layout_strategy = "horizontal",
			file_sorter =  require'telescope.sorters'.get_fuzzy_file,
			border = {},
			borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
			color_devicons = true,
	}
}

