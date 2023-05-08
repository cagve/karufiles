--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- Themes
	use 'folke/tokyonight.nvim'
	use "ellisonleao/gruvbox.nvim"

	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use 'nvim-treesitter/playground'
	use 'nvim-lua/plenary.nvim'
	use 'ThePrimeagen/harpoon'
	use  "alexghergh/nvim-tmux-navigation"
	use 'nvim-lualine/lualine.nvim'

	-- TELESCOPE
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }
	use 'nvim-telescope/telescope-symbols.nvim'

	-- LSP
	use { 'neovim/nvim-lspconfig' }


	-- Autocompletion
	use { 'hrsh7th/nvim-cmp' }
	use { 'hrsh7th/cmp-buffer' }
	use { 'hrsh7th/cmp-path' }
	use { 'saadparwaiz1/cmp_luasnip' }
	use { 'hrsh7th/cmp-nvim-lsp' }
	use { 'hrsh7th/cmp-nvim-lua' }

	-- Snippets
	use { 'L3MON4D3/LuaSnip' }

	use 'preservim/tagbar' -- Tag bar to display info
	use 'godlygeek/tabular'
	use 'vimwiki/vimwiki'
	use {
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	}
	use 'tpope/vim-surround'	-- Surround
	use 'tpope/vim-fugitive'	-- Git
	use 'kdheepak/lazygit.nvim'
	use 'windwp/nvim-autopairs' -- Close pairs

	-- LaTeX
	use 'lervag/vimtex'
	use 'anufrievroman/vim-angry-reviewer'
end)
