require('ibl').setup({
  indent = {
    char = "│",
    tab_char = "│",
  },
  scope = {
    show_start = false,
    show_end = false,
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
