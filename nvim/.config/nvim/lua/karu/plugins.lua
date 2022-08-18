-- PACKER INSTALLED
return require('packer').startup(function()
		use 'wbthomason/packer.nvim'
		use 'junegunn/goyo.vim'
		use 'preservim/tagbar'	-- Tag bar to display info
		use 'numirias/semshi'	-- Python tool
		use 'lukas-reineke/indent-blankline.nvim'
		use 'ThePrimeagen/harpoon' -- Just love
		use 'hrsh7th/cmp-buffer' -- cmp with buffer info
		use 'hrsh7th/cmp-nvim-lsp' -- cmp with lsp info
		use 'hrsh7th/cmp-nvim-lua' -- cmp lua 
		use 'hrsh7th/cmp-path' -- cmp with path info
		use 'saadparwaiz1/cmp_luasnip' -- cmp Snippets
		use 'hrsh7th/nvim-cmp' -- cmp
		use 'kyazdani42/nvim-web-devicons' -- icons
		use 'lervag/vimtex' -- Latex Stuff -> Migrate to not use vimtex
		use 'morhetz/gruvbox' -- Theme
		use 'neovim/nvim-lspconfig' -- Config lsp
		use 'nvim-lua/plenary.nvim' 
		use 'nvim-lua/popup.nvim'
		use 'nvim-lualine/lualine.nvim' -- line
		use 'nvim-telescope/telescope.nvim' -- <3
		use 'godlygeek/tabular'
		use 'nvim-treesitter/nvim-treesitter' -- Syntax highlight etc
		use 'nvim-treesitter/playground' 
		use 'L3MON4D3/LuaSnip' -- Snippets
		use 'tpope/vim-commentary' -- Comment line with gc
		use 'tpope/vim-fugitive' -- Github
		use 'tpope/vim-surround' -- Surround
		use 'vimwiki/vimwiki' -- wiki
		use 'windwp/nvim-autopairs' -- Close pairs
		use 'wbthomason/packer.nvim'
		use "nvim-telescope/telescope-file-browser.nvim" 
	end)

