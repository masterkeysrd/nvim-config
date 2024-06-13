require('conform').setup({
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
