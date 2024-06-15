local ok, bufremove = pcall(require, 'mini.bufremove')
local notify_opts = { title = 'Editor' }

if not ok then
  vim.notify('bufremove is not installed', vim.log.levels.ERROR, notify_opts)
  return
end

bufremove.setup({
  set_vim_settings = true,
  silent = true,
})

vim.keymap.set('n', '<leader>bd', function()
  bufremove.delete(0)
end, { silent = true, desc = 'Delete buffer' })
