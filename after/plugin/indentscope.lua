require('mini.indentscope').setup({
  symbol = "│",
  options = { try_as_border = true },
  draw = {
    delay = 0
  }
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "help",
    "alpha",
    "dashboard",
    "neo-tree",
    "Trouble",
    "trouble",
    "lazy",
    "mason",
    "notify",
    "toggleterm",
    "lazyterm",
    "NvimTree",
    "nvimtree",
    "nvim-tree",
  },
  callback = function()
    vim.b.miniindentscope_disable = true
  end,
})
