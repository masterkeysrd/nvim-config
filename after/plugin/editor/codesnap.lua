local ok, codesnap = pcall(require, 'codesnap')


if not ok then
  vim.notify('codesnap is not installed', vim.log.levels.ERROR, { title = 'codesnap.nvim' })
  return
end

codesnap.setup({
  save_path = '~/Pictures/codesnap',

  bg_theme = 'sea',
  watermark = "",

  has_breadcrumbs = true,
  show_workspace = true,

  has_line_number = true,
})

-- Keymap
vim.keymap.set('x', '<leader>ss', function()
  codesnap.copy_into_clipboard()
end, { noremap = true, silent = true, desc = 'Capture code snippet' })
