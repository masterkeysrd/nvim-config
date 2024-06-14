local ok, spectre = pcall(require, 'spectre')
local notify_opts = { title = 'spectre.nvim' }

if not ok then
  vim.notify('spectre.nvim not found', vim.log.levels.ERROR, notify_opts)
  return
end

spectre.setup({
  open_cmd = 'noswapfile vnew',
})


local map = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

map('n', '<leader>pr', function()
  spectre.toggle()
end, opts('Toggle Spectre'))

map('n', '<C-S-f>', function()
  spectre.open_visual({ select_word = true })
end, opts('Search current word'))

map('v', '<C-S-f>', function()
  spectre.open_visual({ select_word = true })
end, opts('Search visual selection'))
