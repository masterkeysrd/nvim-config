require('mini.bufremove').setup {
  set_vim_settings = true,
  silent = true,
}

vim.keymap.set('n', '<leader>bd', function()
  require('mini.bufremove').delete(0)
end)
