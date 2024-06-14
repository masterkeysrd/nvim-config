local ok, ts_comments = pcall(require, 'ts-comments')
local notify_opts = { title = 'ts-comments.nvim' }

if not ok then
  vim.notify('ts-comments.nvim not found', vim.log.levels.ERROR, notify_opts)
  return
end

ts_comments.setup({})
