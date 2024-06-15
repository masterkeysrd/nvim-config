local function map(lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc }
  vim.keymap.set('n', lhs, rhs, opts)
end

map('<leader>mp', '<cmd>MarkdownPreview<CR>', 'Markdown Preview')
map('<leader>mc', '<cmd>MarkdownPreviewClose<CR>', 'Markdown Preview Close')
