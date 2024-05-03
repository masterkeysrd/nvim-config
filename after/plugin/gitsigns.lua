require('gitsigns').setup {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  on_attach = function(bufnr)
    local gitsigns = require('gitsigns')
    local function opts(desc)
      return { desc = desc, buffer = bufnr }
    end

    vim.keymap.set('n', '<leader>gb', gitsigns.toggle_current_line_blame, opts "Toggle blame")
    vim.keymap.set('n', '<leader>gh', gitsigns.preview_hunk, opts "Preview hunk")
    vim.keymap.set('n', '<leader>gr', gitsigns.reset_hunk, opts "Reset hunk")
  end,
}
