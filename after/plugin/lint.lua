require('lint').linters_by_ft = {
  markdown = { 'markdownlint', 'vale' },
  javascript = { 'eslint' },
  typescript = { 'eslint' },
  go = { 'golangcilint' },
  proto = { 'buf' },
}

vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
  callback = function()
    require('lint').try_lint()
  end,
})
