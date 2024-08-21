local function toggle()
  local buf = vim.api.nvim_get_current_buf()
  local name = vim.api.nvim_buf_get_name(buf)

  if name:find("fugitive://") then
    vim.api.nvim_command("bd")
  else
    vim.api.nvim_command("G | only")
  end
end

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local function confirm(msg, cmd)
  return function()
    local choice = vim.fn.confirm(msg, "&Yes\n&No", 2)

    if choice == 1 then
      vim.api.nvim_command(cmd)
    end
  end
end

vim.keymap.set("n", "<leader>gs", toggle, opts("Toggle git status"))
vim.keymap.set("n", "<leader>gc", "<cmd>G commit<CR>", opts("Commit changes"))

vim.keymap.set("n", "<leader>gps", confirm("Push changes?", "G push"), opts("Push changes"))
vim.keymap.set("n", "<leader>gpl", confirm("Pull changes?", "G pull"), opts("Pull changes"))
vim.keymap.set("n", "<leader>gpL", confirm("Pull changes (no rebase)?", "G pull --no-rebase"),
  opts("Pull changes with no rebase"))
