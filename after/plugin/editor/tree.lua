local ok, nvim_tree = pcall(require, "nvim-tree")
local notify_opts = { title = "nvim-tree.lua" }

if not ok then
  vim.notify("nvim-tree.lua not found", vim.log.levels.ERROR, notify_opts)
  return
end

nvim_tree.setup({
  disable_netrw = false,
  hijack_cursor = true,
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 35,
  },
  actions = {
    change_dir = {
      restrict_above_cwd = true,
    }
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    -- I want to set the icon for the root folder
    root_folder_label = ":t",
    indent_markers = {
      enable = true,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
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

local map = vim.keymap.set
local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

map("n", "<leader>e", vim.cmd.NvimTreeToggle, opts("Toggle NvimTree"))
map("n", "<leader>r", vim.cmd.NvimTreeRefresh, opts("Refresh NvimTree"))
map("n", "<leader>n", vim.cmd.NvimTreeFindFile, opts("Find file in NvimTree"))
