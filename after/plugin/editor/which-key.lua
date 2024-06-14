local ok, wk = pcall(require, "which-key")
local notify_opts = { title = "which-key.nvim" }

if not ok then
  vim.notify("which-key.nvim not found", vim.log.levels.ERROR, notify_opts)
  return
end

vim.o.timeout = true
vim.o.timeoutlen = 500

wk.setup({
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
})

wk.register({
  g = { name = "+Go to" },
  z = { name = "+Fold" },
  P = { name = "+Peek" },
  ["["] = { name = "+Previous" },
  ["]"] = { name = "+Next" },
  ["<leader>"] = { name = "+Leader" },
})

wk.register({
  b = { name = "+Buffer" },
  g = { name = "+Git" },
  gh = { name = "+Git hunk" },
  p = { name = "+Project" },
}, { prefix = "<leader>" })

wk.register({
  s = { name = "+Snapshots" },
}, { prefix = "<leader>", mode = "v" })


vim.keymap.set("n", "<leader><leader>", function()
  wk.show()
end, { silent = true, desc = "Show which-key" })
