vim.api.nvim_create_autocmd({ 'BufEnter', 'InsertLeave' }, {
  group = vim.api.nvim_create_augroup('codelens', { clear = true }),
  desc = 'Refresh codelens on BufEnter and InsertLeave',
  callback = function()
    local exclude_ft = {
      'fugitiveblame',
      'fugitive',
      'git',
      'gitignore',
      'gitcommit',
      'gitrebase',
      'gitconfig',
      'gitstatus',
      'gitcommit',
      'dashboard',
      'NvimTree',
    }

    if vim.tbl_contains(exclude_ft, vim.bo.filetype) then
      return
    end

    vim.lsp.codelens.refresh({ bufnr = 0 })
  end,
})
