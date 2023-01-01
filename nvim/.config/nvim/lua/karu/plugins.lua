return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'christoomey/vim-tmux-navigator'
    use 'anufrievroman/vim-angry-reviewer'
    use 'preservim/tagbar'	-- Tag bar to display info
    use 'lukas-reineke/indent-blankline.nvim'
    use 'ThePrimeagen/harpoon' -- Just love
    use 'hrsh7th/cmp-buffer' -- cmp with buffer info
    use 'hrsh7th/cmp-nvim-lsp' -- cmp with lsp info
    use 'hrsh7th/cmp-nvim-lua' -- cmp lua 
    use 'hrsh7th/cmp-path' -- cmp with path info
    use 'saadparwaiz1/cmp_luasnip' -- cmp Snippets
    use 'hrsh7th/nvim-cmp' -- cmp
    use 'kyazdani42/nvim-web-devicons' -- icons
    use 'mfussenegger/nvim-jdtls'
    
    -- LATEX
    use 'lervag/vimtex' -- 
    use 'KeitaNakamura/tex-conceal.vim'


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
    use 'windwp/nvim-autopairs' -- Close pairs
    use "nvim-telescope/telescope-file-browser.nvim" 

    use 'lewis6991/spellsitter.nvim' -- Correct spelling in latex. COnfig in treesitter.lua
    use 'inkarkat/vim-SpellCheck'
    use 'inkarkat/vim-ingo-library'
    use 'subnut/nvim-ghost.nvim'

    use 'vimwiki/vimwiki'

    -- THEMES
    use 'morhetz/gruvbox'           -- NORMAL FOR LATEX
    use 'luisiacc/gruvbox-baby'     -- REALLY GOOD
    use 'tiagovla/tokyodark.nvim'
    use 'sainnhe/gruvbox-material' -- SOFT But working with vimwiki
    use 'rafamadriz/neon'           -- NOT BAD
    use {'RishabhRD/gruvy', require = {'rktjmp/lush.nvim'}} -- NOT BAD
    use 'mhartington/oceanic-next' -- NOT BAD

end)

