-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.4',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  -- ColorScheme
  use("gruvbox-community/gruvbox")
  -- Shade for not having the highligh
  use("sunjon/shade.nvim")

  -- Treesitter
  use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
  use("nvim-treesitter/playground")

  use("theprimeagen/harpoon")
use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }
  
  -- Common Tool for neovim
  use("tpope/vim-commentary")
  use('lukas-reineke/indent-blankline.nvim') 

  -- LuaSnips
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})

  
end)
