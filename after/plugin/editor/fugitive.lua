function FugitiveToggle()
  if FugitiveCloseCurrentTab() then
    return
  end

  FugitiveCloseCurrentTab()
  FugitiveOpen()
end

function FugitiveCloseCurrentTab()
  local tab = vim.api.nvim_get_current_tabpage()
  local is_current, ok = pcall(vim.api.nvim_tabpage_get_var, tab, "is_fugitive")

  if ok and is_current then
    vim.api.nvim_command("tabclose")
    return true
  end

  return false
end

function FugitiveCloseAllTabs()
  local tab_list = vim.api.nvim_list_tabpages()

  for _, tab in ipairs(tab_list) do
    local result, ok = pcall(vim.api.nvim_tabpage_get_var, tab, "is_fugitive")

    if ok and result then
      vim.api.nvim_set_current_tabpage(tab)
      vim.api.nvim_command("tabclose")
    end
  end
end

function FugitiveOpen()
  vim.api.nvim_command("tab Git")
  vim.api.nvim_tabpage_set_var(0, "is_fugitive", true)
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

vim.keymap.set("n", "<leader>gs", FugitiveToggle, opts("Toggle Git tab"))
vim.keymap.set("n", "<leader>gc", "<cmd>G commit<CR>", opts("Commit changes"))

vim.keymap.set("n", "<leader>gps", confirm("Push changes?", "G push"), opts("Push changes"))
vim.keymap.set("n", "<leader>gpl", confirm("Pull changes?", "G pull"), opts("Pull changes"))
vim.keymap.set("n", "<leader>gpL", confirm("Pull changes (no rebase)?", "G pull --no-rebase"),
  opts("Pull changes with no rebase"))
