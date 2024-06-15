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

-- Setup rose-pine
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
  },

  highlight_groups = {
    -- Auto completion
    CmpItemAbbr = { fg = "text" },            -- completion text
    CmpItemAbbrDeprecated = { fg = "muted" }, -- completion deprecated text
    CmpItemAbbrMatch = { fg = "rose" },       -- completion matched text
    CmpItemAbbrMatchFuzzy = { fg = "rose" },  -- completion fuzzy matched text
    CmpItemKindVariable = { fg = "iris" },    -- completion variable kind
    CmpItemKindInterface = { fg = "iris" },   -- completion interface kind
    CmpItemKindText = { fg = "iris" },        -- completion text kind
    CmpItemKindFunction = { fg = "rose" },    -- completion function kind
    CmpItemKindMethod = { fg = "rose" },      -- completion method kind
    CmpItemKindKeyword = { fg = "gold" },     -- completion keyword kind
    CmpItemKindProperty = { fg = "gold" },    -- completion property kind
    CmpItemKindUnit = { fg = "gold" },        -- completion unit kind
    CmpGhostText = { fg = "muted" },          -- completion ghost text

    -- LSP
    LspCodeLens = { fg = "rose" },          -- LSP codelens
    LspCodeLensSeparator = { fg = "rose" }, -- LSP codelens separator
  }
})

vim.cmd.colorscheme("rose-pine")
