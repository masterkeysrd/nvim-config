require("nvim-tree").setup({
  disable_netrw = false,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "S",
          unmerged = "",
          renamed = "➜",
          deleted = "",
          untracked = "U",
          ignored = "◌",
        },
        folder = {
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
        },
      },
    },
  },
  filters = {
    git_ignored = false,
    custom = { '^.git$' }
  },
  diagnostics = {
    enable = true,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  update_focused_file = {
    enable = true,
  }
})

vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle)
vim.keymap.set("n", "<leader>r", vim.cmd.NvimTreeRefresh)
vim.keymap.set("n", "<leader>n", vim.cmd.NvimTreeFindFile)
