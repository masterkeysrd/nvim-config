local ok, notify = pcall(require, "notify")
local notify_opts = { title = "UI" }

if not ok then
  vim.notify("notify.nvim not found", vim.log.levels.ERROR, notify_opts)
  return
end

notify.setup({
  stages = 'static',
  timeout = 3000,
  max_height = function()
    return math.floor(vim.o.lines * 0.75)
  end,
  max_width = function()
    return math.floor(vim.o.columns * 0.75)
  end,
  on_open = function(win)
    vim.api.nvim_win_set_config(win, { zindex = 100 })
  end,
})

vim.keymap.set('n', '<leader>nd', function()
  notify.dismiss({ silent = true, pending = true })
end, { silent = true, desc = 'Dismiss all notifications' })
