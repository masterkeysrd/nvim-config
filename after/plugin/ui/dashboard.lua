local ok, db = pcall(require, "dashboard")
local notify_opts = { title = "Editor" }

if not ok then
  vim.notify("dashboard.nvim not found", vim.log.levels.ERROR, notify_opts)
  return
end

local logo = [[
███╗   ███╗ █████╗ ███████╗████████╗███████╗██████╗     ██╗   ██╗██╗███╗   ███╗
████╗ ████║██╔══██╗██╔════╝╚══██╔══╝██╔════╝██╔══██╗    ██║   ██║██║████╗ ████║
██╔████╔██║███████║███████╗   ██║   █████╗  ██████╔╝    ██║   ██║██║██╔████╔██║
██║╚██╔╝██║██╔══██║╚════██║   ██║   ██╔══╝  ██╔══██╗    ╚██╗ ██╔╝██║██║╚██╔╝██║
██║ ╚═╝ ██║██║  ██║███████║   ██║   ███████╗██║  ██║     ╚████╔╝ ██║██║ ╚═╝ ██║
╚═╝     ╚═╝╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝      ╚═══╝  ╚═╝╚═╝     ╚═╝
]]

logo = string.rep("\n", 8) .. logo .. "\n\n"

db.setup({
  theme = 'doom',
  config = {
    header = vim.split(logo, "\n"),
    center = {
      { icon = " ", desc = " Find File", key = "f", action = "Telescope find_files" },
      { icon = " ", desc = " New File", key = "n", action = "ene | startinsert" },
      { icon = " ", desc = " Recent files", key = "r", action = "Telescope oldfiles" },
      { icon = " ", desc = " Quit", key = "q", action = function() vim.api.nvim_input('<cmd>qa<cr>') end },
    },
    footer = {} --your footer
  }
})
