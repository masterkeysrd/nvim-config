vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("i", "jj", "<Esc>", opts)

-- Save with Ctrl+s
keymap("n", "<C-S>", ":w<CR>", { noremap = true })

-- In visual mode move text with J and K
keymap("x", "K", ":move -2<CR>gv=gv", opts)
keymap("x", "J", ":move '>+<CR>gv=gv", opts)

keymap("n", "<C-J>", "<C-W><C-J>", opts)
keymap("n", "<C-K>", "<C-W><C-K>", opts)
keymap("n", "<C-L>", "<C-W><C-L>", opts)
keymap("n", "<C-H>", "<C-W><C-H>", opts)
