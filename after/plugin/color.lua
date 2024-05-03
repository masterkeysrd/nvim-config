function ColorMyPencils(color)
  color = color or "rose-pine"
  vim.cmd.colorscheme(color)
end

require('rose-pine').setup({
  styles = {
    italic = false,
  },
})

vim.cmd("colorscheme rose-pine-moon")
ColorMyPencils()
