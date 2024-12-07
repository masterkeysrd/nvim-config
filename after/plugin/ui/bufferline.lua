local ok, bufferline = pcall(require, "bufferline")
local notify_opts = { title = "UI" }

if not ok then
  vim.notify("bufferline.nvim not found", vim.log.levels.ERROR, notify_opts)
  return
end

local exclude_ft = {
  'qf',
  'fugitive'
}

local function close_buffer(n)
  local found, bufrem = pcall(require, "mini.bufremove")

  if not found then
    vim.notify("mini.bufremove not found", vim.log.levels.ERROR, { title = "Bufferline" })
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
    indicator = {
      icon = "▎",
      style = 'icon',
    },
    offsets = {
      {
        filetype = "NvimTree",
        text = "File Explorer",
        separator = true,
        text_align = "left",
      },
    },
    style_preset = {
      bufferline.style_preset.no_italic,
      bufferline.style_preset.no_bold,
    },
    custom_filter = function(buf)
      if not vim.tbl_contains(exclude_ft, vim.bo[buf].filetype) then
        return true
      end
    end,
  },
})

local map = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local function go_to_buffer(n)
  return function()
    bufferline.go_to(n, true)
  end
end

map('n', '<leader>1', go_to_buffer(1), opts("Go to buffer 1"))
map('n', '<leader>2', go_to_buffer(2), opts("Go to buffer 2"))
map('n', '<leader>3', go_to_buffer(3), opts("Go to buffer 3"))
map('n', '<leader>4', go_to_buffer(4), opts("Go to buffer 4"))
map('n', '<leader>5', go_to_buffer(5), opts("Go to buffer 5"))
map('n', '<leader>6', go_to_buffer(6), opts("Go to buffer 6"))
map('n', '<leader>7', go_to_buffer(7), opts("Go to buffer 7"))
map('n', '<leader>8', go_to_buffer(8), opts("Go to buffer 8"))
map('n', '<leader>9', go_to_buffer(9), opts("Go to buffer 9"))
map('n', '<leader>$', go_to_buffer(-1), opts("Go to last buffer"))
