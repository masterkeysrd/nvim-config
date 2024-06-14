local trouble = require('trouble')

trouble.setup({})

local map = vim.keymap.set

local function opts(desc)
  return { silent = true, desc = desc }
end

local function toggle_trouble(mode)
  return function()
    trouble.toggle(mode)
  end
end

map("n", "<leader>xx", toggle_trouble('diagnostics'), opts('Trouble diagnostics'))
map("n", "<leader>xq", toggle_trouble('quickfix'), opts('Trouble quickfix'))
map("n", "<leader>xl", toggle_trouble('loclist'), opts('Trouble loclist'))
map("n", "gR", toggle_trouble('lsp_references'), opts('Trouble lsp_references'))
map("n", "<leader>xt", toggle_trouble('todo'), opts('Trouble todo'))
