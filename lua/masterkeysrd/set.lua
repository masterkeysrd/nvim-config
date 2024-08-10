-- set global options
vim.opt.guicursor = ""

-- set line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- indent
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- line wrap
vim.opt.wrap = false

-- undo/redo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- terminal colors
vim.opt.termguicolors = true

-- clipboard
vim.opt.clipboard = vim.env.SSH_TTY and "" or "unnamedplus"

-- save
vim.opt.confirm = true

-- scrolloff
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- faster completion
vim.opt.updatetime = 250

-- encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = "utf-8"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- editor configs
vim.opt.colorcolumn = "99"
vim.opt.updatetime = 50

-- editor folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldcolumn = "0"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldnestmax = 3

-- editor appearance
vim.opt.virtualedit = "block"

-- fill chars
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
}

vim.opt.smoothscroll = true

-- Fix markdown indentation settings
vim.g.markdown_recommende_style = 0

-- Spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true
