local ok, lint = pcall(require, 'lint')
local notify_opts = { title = 'Linting' }

if not ok then
  vim.notify('nvim-lint not installed', vim.log.levels.ERROR, notify_opts)
  return
end

lint.linters_by_ft = {
  make = { 'checkmake' },
  markdown = { 'markdownlint' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  typescriptreact = { 'eslint' },
  go = { 'golangcilint' },
  proto = { 'protolint' },
  json = { 'jsonlint' },
  yaml = { 'yamllint' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('linting', { clear = true }),
  callback = function()
    require('lint').try_lint()
  end,
})
