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

vim.keymap.set("n", "<leader>gs", FugitiveToggle)
