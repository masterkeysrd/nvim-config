require 'nvim-treesitter.configs'.setup {
  sync_install = false,
  auto_install = true,
  highlight = { enable = true },
  indent = { enable = true },
}

vim.treesitter.language.register('xml', { 'svg', 'xslt' })
vim.treesitter.language.register('json', { 'json.tmpl' })
