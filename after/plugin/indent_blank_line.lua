require('ibl').setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = {
    enabled = false
  },
  exclude = {
    buftypes = {
      'terminal',
      'nofile',
    },
    filetypes = {
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
    },
  },
})
