-- set line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indent
vim.opt.tabstop = 4 -- A TAB character looks like 4 spaces
vim.opt.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.opt.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.opt.shiftwidth = 4 -- Number of spaces inserted when indenting

-- scrolloff
vim.opt.scrolloff = 10

-- disable netrw at the very start of your init.lua

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

