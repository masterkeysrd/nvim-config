vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('codelens', { clear = true }),
  desc = 'Refresh codelens on BufEnter and InsertLeave',
  callback = function()
    vim.lsp.codelens.refresh({ bufnr = 0 })
  end,
})
