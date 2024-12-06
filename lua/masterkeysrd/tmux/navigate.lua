local M = {}

local directions = {
  h = "L",
  j = "D",
  k = "U",
  l = "R",
}

M.setup = function(config)
  -- check if tmux is installed
  if vim.fn.executable("tmux") == 0 then
    return
  end

  -- check if we are in tmux
  if vim.fn.getenv("TMUX") == "" then
    return
  end

  if config then
    if config.on_attach then
      config.on_attach()
    end
  end
end

local function navigate_vim_split(direction)
  local winnr = vim.fn.winnr()
  vim.cmd("wincmd " .. direction)
  return winnr ~= vim.fn.winnr()
end

local function navigate_pane(direction)
  return function()
    if not navigate_vim_split(direction) then
      vim.fn.system("tmux select-pane -" .. directions[direction])
    end
  end
end

M.navigate = function(direction)
  return navigate_pane(direction)
end

M.left = navigate_pane("h")
M.down = navigate_pane("j")
M.up = navigate_pane("k")
M.right = navigate_pane("l")

return M
