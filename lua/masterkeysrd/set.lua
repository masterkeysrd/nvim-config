vim.opt.guicursor = ""

-- set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- scrolloff
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- faster completion
vim.opt.updatetime = 250

-- encoding
vim.opt.fileencoding = "utf-8"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- editor configs
vim.opt.colorcolumn = "80"
vim.opt.updatetime = 50
