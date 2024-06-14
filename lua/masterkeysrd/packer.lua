-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use { 'tpope/vim-fugitive' }
  use { 'nvim-lualine/lualine.nvim' }
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
      { 'petertriho/cmp-git' },
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use {
    'akinsho/toggleterm.nvim',
    config = true
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use { 'RRethy/vim-illuminate' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'echasnovski/mini.indentscope' }
  use {
    'nvimdev/dashboard-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use { "github/copilot.vim" }


  use { 'echasnovski/mini.bufremove' }
  use { 'mistricky/codesnap.nvim', run = 'make' }
  use { 'MunifTanjim/nui.nvim' }
  use { 'rcarriga/nvim-notify' }
  use {
    'folke/noice.nvim',
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }

  -- Theme Plugins
  use { 'rose-pine/neovim' }

  -- Coding Plugins
  use { 'echasnovski/mini.pairs' }
  use { 'folke/ts-comments.nvim' }
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-path' },
      { 'petertriho/cmp-git' },
      { 'L3MON4D3/LuaSnip' },
    }
  }

  -- Formatting Plugins
  use { 'stevearc/conform.nvim' }

  -- Linting Plugins
  use { 'mfussenegger/nvim-lint' }

  -- LSP Plugins
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    requires = {
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },
      { 'neovim/nvim-lspconfig' },
      { 'hrsh7th/nvim-cmp' },
    }
  }

  -- Editor Plugins
  use { 'nvim-pack/nvim-spectre' }
  use { "lewis6991/gitsigns.nvim" }
  use { 'folke/trouble.nvim' }
  use { 'folke/which-key.nvim' }
  use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.6', requires = 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter Plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }
  use({
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = "nvim-treesitter/nvim-treesitter",
  })
  use { 'windwp/nvim-ts-autotag' }
end)
