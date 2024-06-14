local ok, conform = pcall(require, 'conform')
local notify_opts = { title = 'conform.nvim' }

if not ok then
  vim.notify('conform.nvim not found', vim.log.levels.ERROR, notify_opts)
  return
end

conform.setup({
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    javascript = { { 'prettierd', 'prettier' } },
    go = { 'goimports', 'gofumpt' },
    sh = { 'shfmt' },
    proto = { 'buf' },
    protobuf = { 'buf' },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters = {
    injected = {
      options = { ignore_errors = true },
    }
  }
})
