require("nvim-tree").setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    git_clean = false,
    no_buffer = false,
    custom = { '.git' }
  },
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>r", vim.cmd.NvimTreeRefresh)
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFile)

