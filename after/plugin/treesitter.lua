local ok, ts_configs = pcall(require, 'nvim-treesitter.configs')
local notify_opts = { title = 'Treesitter' }

if not ok then
  vim.notify('nvim-treesitter not installed', vim.log.levels.ERROR, notify_opts)
  return
end

ts_configs.setup({
  indent = { enable = true },
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "git_config",
    "gitcommit",
    "git_rebase",
    "gitignore",
    "gitattributes",
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
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
      node_decremental = "<bs>",
    },
  },
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
      goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer" },
      goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
      goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer" },
    },
  },
})

vim.treesitter.language.register('xml', { 'svg', 'xslt' })
vim.treesitter.language.register('json', { 'json.tmpl' })


local ok_ts_autotag, ts_autotag = pcall(require, 'nvim-ts-autotag')

if not ok_ts_autotag then
  vim.notify('nvim-ts-autotag not installed', vim.log.levels.ERROR, notify_opts)
  return
end

ts_autotag.setup({
})
