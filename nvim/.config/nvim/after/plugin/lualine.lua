local function is_tex()
	if vim.bo.filetype ~= 'tex' then
		return false
	else
		return true
	end
end

local function grammarly()
	local client = vim.lsp.get_active_clients({bufnr=0, name="grammarly"})
	if next(client) == nil then
		return ""
	else
		return ""
   end
end

require('lualine').setup {
  options = {
    -- icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
	lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', {'diagnostics', symbols={error = ' ', warn = ' ', info = ' '}}, {grammarly, cond = is_tex}},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}


