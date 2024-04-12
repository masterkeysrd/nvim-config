-- set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indent
vim.opt.smartindent = true
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.tabstop = 2 -- A TAB character looks like 4 spaces
vim.opt.softtabstop = 2 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 2 -- Number of spaces inserted when indenting

-- clipboard
vim.opt.clipboard = 'unnamedplus'

-- scrolloff
vim.opt.scrolloff = 10

-- faster completion
vim.opt.updatetime = 250

-- encoding
vim.opt.fileencoding = "utf-8"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

