-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.6',
    requires = 'nvim-lua/plenary.nvim'
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }
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
      { 'L3MON4D3/LuaSnip' },
    }
  }
  use {
    'akinsho/toggleterm.nvim',
    config = true
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use { 'RRethy/vim-illuminate' }
  use { 'stevearc/conform.nvim' }
  use { 'mfussenegger/nvim-lint' }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'echasnovski/mini.indentscope' }
  use {
    'nvimdev/dashboard-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
  use { "github/copilot.vim" }
  use { "lewis6991/gitsigns.nvim" }
  use { 'folke/trouble.nvim' }
  use { 'folke/ts-comments.nvim' }
  use { 'echasnovski/mini.bufremove' }
  use { 'echasnovski/mini.pairs' }
  use {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  }
  use { 'rose-pine/neovim' }
end)
