local ok, rose_pine = pcall(require, "rose-pine")

if not ok then
  vim.notify(
    "rose-pine.nvim is not installed. using default colorscheme",
    vim.log.levels.ERROR,
    { title = 'rose-pine.nvim' }
  )

  vim.cmd.colorscheme("vim")
  return
end

rose_pine.setup({
  variant = "moon",
  dark_variant = "moon",
  dim_inactive_windows = false,
  extend_background_behind_borders = true,

  styles = {
    bold = true,
    italic = false,
    transparency = false,
  },


  groups = {
    border = "muted",
    link = "iris",
    panel = "surface",

    error = "love",
    hint = "iris",
    info = "foam",
    note = "pine",
    todo = "rose",
    warn = "gold",

    git_add = "foam",
    git_change = "rose",
    git_delete = "love",
    git_dirty = "rose",
    git_ignore = "muted",
    git_merge = "iris",
    git_rename = "pine",
    git_stage = "iris",
    git_text = "rose",
    git_untracked = "subtle",

    h1 = "iris",
    h2 = "foam",
    h3 = "rose",
    h4 = "gold",
    h5 = "pine",
    h6 = "foam",
  }
})

vim.cmd.colorscheme("rose-pine")