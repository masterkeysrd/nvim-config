require 'nvim-treesitter.configs'.setup {
  indent = { enable = true },
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "go",
    "javascript",
    "typescript",
    "python",
    "json"
  },
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
}

vim.treesitter.language.register('xml', { 'svg', 'xslt' })
vim.treesitter.language.register('json', { 'json.tmpl' })
