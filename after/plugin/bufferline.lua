require('bufferline').setup({
  options = {
    diagnostics = "nvim_lsp",
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "Explorer",
        separator = true,
        highlight = "Directory",
        text_align = "left",
      },
    },
  },
})
