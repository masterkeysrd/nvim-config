local ok, bufferline = pcall(require, "bufferline")

if not ok then
  vim.notify("Bufferline not found", vim.log.levels.ERROR, { title = "Bufferline" })
  return
end

local function close_buffer(n)
  local found, bufrem = pcall(require, "mini.bufremove")

  if not found then
    vim.notify("Bufferline not found", vim.log.levels.ERROR, { title = "Bufferline" })
    return
  end

  bufrem.delete(n)
end

bufferline.setup({
  options = {
    mode = "buffers",
    themable = true,
    numbers = 'ordinal',
    diagnostics = "nvim_lsp",
    close_command = close_buffer,
    always_show_bufferline = false,
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        separator = true,
        highlight = "Directory",
        text_align = "left",
      },
    },
    style_preset = {
      bufferline.style_preset.no_italic,
    }
  },
})

local map = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end


map('n', '<leader>1', function()
  bufferline.go_to(1, true)
end, opts("Go to buffer 1"))

map('n', '<leader>2', function()
  bufferline.go_to(2, true)
end, opts("Go to buffer 2"))

map('n', '<leader>3', function()
  bufferline.go_to(3, true)
end, opts("Go to buffer 3"))

map('n', '<leader>4', function()
  bufferline.go_to(4, true)
end, opts("Go to buffer 4"))

map('n', '<leader>5', function()
  bufferline.go_to(5, true)
end, opts("Go to buffer 5"))

map('n', '<leader>6', function()
  bufferline.go_to(6, true)
end, opts("Go to buffer 6"))

map('n', '<leader>7', function()
  bufferline.go_to(7, true)
end, opts("Go to buffer 7"))

map('n', '<leader>8', function()
  bufferline.go_to(8, true)
end, opts("Go to buffer 8"))

map('n', '<leader>9', function()
  bufferline.go_to(9, true)
end, opts("Go to buffer 9"))

map('n', '<leader>$', function()
  bufferline.go_to(-1, true)
end, opts("Go to last buffer"))
