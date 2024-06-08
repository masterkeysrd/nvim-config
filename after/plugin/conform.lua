require('conform').setup({
  formatters_by_tf = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    javascript = { { 'prettierd', 'prettier' } },
    go = { 'goimports', 'gofmt' },
    sh = { 'shfmt' },
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


require('conform').formatters.prettier = {
}
