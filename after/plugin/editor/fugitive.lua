local opened_in_other_tab = false

function FugitiveToggle()
  local buf = vim.api.nvim_get_current_buf()
  local bufname = vim.api.nvim_buf_get_name(buf)

  if string.match(bufname, "fugitive://") then
    FugitiveClose()
  else
    FugitiveOpen()
  end
end

function FugitiveOpen()
  if opened_in_other_tab then
    vim.cmd("tabclose")
  end

  vim.cmd("tab Git")
  opened_in_other_tab = true
end

function FugitiveClose()
  if opened_in_other_tab then
    pcall(function()
      vim.cmd("tabclose")
    end)
    opened_in_other_tab = false
  end
end

vim.keymap.set("n", "<leader>gs", FugitiveToggle)
