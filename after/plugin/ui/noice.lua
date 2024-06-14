local ok, noice = pcall(require, "noice")

if not ok then
  vim.notify("Noice not found", vim.log.levels.ERROR)
  return
end

noice.setup({
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  routes = {
    {
      filter = {
        event = "msg_show",
        any = {
          { find = "%d+L, %d+B" },
          { find = "; after #%d+" },
          { find = "; before #%d+" },
        },
      },
      view = "mini",
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  }
})

local map = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local function noice_cmd(cmd)
  return function()
    noice.cmd(cmd)
  end
end

map('c', '<S-Enter>', function()
  noice.redirect(vim.fn.getcmdline())
end, opts("Redirect Cmdline"))

map('n', '<leader>nl', noice_cmd("last"), opts("Show last notification"))
map('n', '<leader>nh', noice_cmd("history"), opts("Show notification history"))
map('n', '<leader>na', noice_cmd("all"), opts("Show all notifications"))
map('n', '<leader>nd', noice_cmd("dismiss"), opts("Dismiss notification"))
map('n', '<leader>np', noice_cmd("pick"), opts("Pick notification"))
