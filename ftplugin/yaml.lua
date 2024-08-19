local function preview()
  local filename = vim.api.nvim_buf_get_name(0)

  if filename:match('openapi%.yaml') then
    vim.cmd('SwaggerPreviewToggle')
  end
end

vim.keymap.set('n', '<leader>fp', preview, { noremap = true, silent = true, desc = 'Preview' })
