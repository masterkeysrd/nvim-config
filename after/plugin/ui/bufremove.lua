local found, bufrem = pcall(require, "mini.bufremove")

local function close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()

  if found then
    bufrem.delete(bufnr)
  else
    -- fallback to default behaviour
    vim.cmd("bd " .. bufnr)
  end
end

vim.keymap.set("n", "<C-w>", close_buffer, { noremap = true, silent = true, desc = "Close buffer" })
