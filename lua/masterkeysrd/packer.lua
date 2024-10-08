-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use { 'wbthomason/packer.nvim' }

  -- Theme Plugins
  use { 'rose-pine/neovim' }

  -- Coding Plugins
  use { 'echasnovski/mini.pairs' }
  use { 'folke/ts-comments.nvim' }
  use { "github/copilot.vim" }
  use { 'L3MON4D3/LuaSnip', tag = 'v2.*' }
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
  use { "b0o/schemastore.nvim" }

  -- Editor Plugins
  use { 'nvim-pack/nvim-spectre' }
  use { "lewis6991/gitsigns.nvim" }
  use { 'folke/trouble.nvim' }
  use { 'folke/which-key.nvim' }
  use { 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' }
  use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
  use { 'nvim-telescope/telescope.nvim', tag = '0.1.6', requires = 'nvim-lua/plenary.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'mistricky/codesnap.nvim', run = 'make' }
  use { 'echasnovski/mini.bufremove' }
  use { 'akinsho/toggleterm.nvim', config = true }
  use { 'tpope/vim-fugitive' }
  use { 'RRethy/vim-illuminate' }
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use {
    "vinnymeller/swagger-preview.nvim",
    run = "npm install -g swagger-ui-watcher",
  }

  -- Debugging Plugins
  use {
    'mfussenegger/nvim-dap',
    requires = {
      { 'rcarriga/nvim-dap-ui' },
      { 'theHamsta/nvim-dap-virtual-text' },
      -- adapters
      { 'leoluz/nvim-dap-go' }
    }
  }
  use {
    "rcarriga/nvim-dap-ui",
    requires = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
  }
  use { 'jay-babu/mason-nvim-dap.nvim', requires = 'williamboman/mason.nvim' }

  -- Testing Plugins
  use {
    "nvim-neotest/neotest",
    requires = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- adapters
      "nvim-neotest/neotest-go",
    }
  }

  -- Treesitter Plugins
  use {
    'nvim-treesitter/nvim-treesitter',
    { run = ':TSUpdate' }
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    requires = "nvim-treesitter/nvim-treesitter",
  }
  use { 'windwp/nvim-ts-autotag' }

  -- UI Plugins
  use { 'nvim-lualine/lualine.nvim' }
  use { 'MunifTanjim/nui.nvim' }
  use { 'rcarriga/nvim-notify' }
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = 'nvim-tree/nvim-web-devicons'
  }
  use {
    'folke/noice.nvim',
    requires = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    }
  }
  use { 'lukas-reineke/indent-blankline.nvim' }
  use { 'echasnovski/mini.indentscope' }
  use {
    'nvimdev/dashboard-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }
end)
