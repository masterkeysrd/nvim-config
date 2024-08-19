local ok, preview = pcall(require, 'swagger-preview')

if not ok then
  vim.notify('swagger-preview not found', vim.log.levels.ERROR, { title = 'Editor Plugins' })
  return
end

preview.setup({
  port = 9000,
  host = 'localhost',
})
