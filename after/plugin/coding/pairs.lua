local ok, pairs = pcall(require, 'mini.pairs')
local notify_opts = { title = 'pairs.nvim' }

if not ok then
  vim.notify('nvim-pairs not found', vim.log.levels.ERROR, notify_opts)
  return
end

pairs.setup({
  mappings = {
    ["`"] = {
      action = "closeopen",
      pair = "``",
      neigh_pattern = "[^\\`].",
      register = { cr = false }
    }
  }
})

vim.keymap.set("n", "<leader>up", function()
  vim.g.minipairs_disable = not vim.g.minipairs_disable

  if vim.g.minipairs_disable then
    vim.notify('Auto Pairs Disabled', vim.log.levels.INFO, notify_opts)
  else
    vim.notify('Auto Pairs Enabled', vim.log.levels.INFO, notify_opts)
  end
end, { noremap = true, silent = true, desc = "Toogle Auto Pairs" })
