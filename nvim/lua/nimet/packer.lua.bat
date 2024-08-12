print("packer lua loaded")
-- packer.lua

-- Check if packer is installed (if not, install it)
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	vim.api.nvim_command('packadd packer.nvim')
end

-- Use packer to install plugins
require('packer').startup(function()

	use({ 'rose-pine/neovim', as = 'rose-pine' })
	--require('packer').startup(function(use)
	--use({ 'rose-pine/neovim', as = 'rose-pine' })
	--end)

	-- Use packer to manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- Coc
	--use 'neoclide/coc.nvim'

	-- NERDTree
	use 'preservim/nerdtree'

	-- Fugitive (git staff)
	use("tpope/vim-fugitive")

	-- Flutter plugin
	use {'thosakwe/vim-flutter'}

	-- Harpoon Plugin
	use('theprimeagen/harpoon')

	-- Toggle Terminal Plugin
	use {"akinsho/toggleterm.nvim", tag = '*', config = function()
		require("toggleterm").setup()
	end}

	-- TreeSitter
	use ('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'}) 

	-- undotree
	use ('mbbill/undotree') 

	-- Commentary
	use ('tpope/vim-commentary') 

	-- Github Copilot
	use ('github/copilot.vim') 

	-- LSP Zero
	-- use {
	-- 	'VonHeikemen/lsp-zero.nvim',
	-- 	branch = 'v3.x',
	-- 	requires = {
	-- 		-- Uncomment these if you want to manage LSP servers from neovim
	-- 		{'williamboman/mason.nvim'},
	-- 		{'williamboman/mason-lspconfig.nvim'},

	-- 		-- LSP Support
	-- 		{'neovim/nvim-lspconfig'},
	-- 		-- Autocompletion
	-- 		{'hrsh7th/nvim-cmp'},
	-- 		{'hrsh7th/cmp-nvim-lsp'},
	-- 		{'L3MON4D3/LuaSnip'},
	-- 	}
	-- }

    -- the last commented out block is the one that works
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
end)


