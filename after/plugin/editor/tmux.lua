local temux_navigate = require('masterkeysrd.tmux.navigate')

local keymap = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

temux_navigate.setup({
  on_attach = function()
    keymap('n', '<C-h>', temux_navigate.left, opts('Navigate left (tmux aware)'))
    keymap('n', '<C-j>', temux_navigate.down, opts('Navigate down (tmux aware)'))
    keymap('n', '<C-k>', temux_navigate.up, opts('Navigate up (tmux aware)'))
    keymap('n', '<C-l>', temux_navigate.right, opts('Navigate right (tmux aware)'))
  end
})
