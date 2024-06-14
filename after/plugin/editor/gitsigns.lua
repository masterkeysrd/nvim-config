local ok, gitsigns = pcall(require, 'gitsigns')
local notify_opts = { title = 'gitsigns.nvim' }

if not ok then
  vim.notify('gitsigns.nvim not found', vim.log.levels.ERROR, notify_opts)
  return
end

gitsigns.setup({
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
    untracked = { text = "▎" },
  },
  on_attach = function(bufnr)
    local function opts(desc)
      return { desc = desc, buffer = bufnr }
    end

    local map = vim.keymap.set

    map('n', '<leader>gb', gitsigns.toggle_current_line_blame, opts "Toggle blame")
    map('n', '<leader>gh', gitsigns.preview_hunk, opts "Preview hunk")
    map('n', '<leader>gr', gitsigns.reset_hunk, opts "Reset hunk")
  end,
})
