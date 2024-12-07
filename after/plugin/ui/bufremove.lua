local found, bufrem = pcall(require, "mini.bufremove")

local quit_ft = {
  "qf",
  "help",
  "toggleterm",
}

local force_bd_ft = {
}

local function close_buffer()
  local bufnr = vim.api.nvim_get_current_buf()

  if vim.tbl_contains(quit_ft, vim.bo[bufnr].filetype) then
    vim.cmd("q")
    return
  end

  if vim.tbl_contains(force_bd_ft, vim.bo[bufnr].filetype) then
    vim.cmd("bd " .. bufnr)
    return
  end

  if found then
    bufrem.delete(bufnr)
  else
    -- fallback to default behaviour
    vim.cmd("bd " .. bufnr)
  end
end

vim.keymap.set("n", "<C-w>", close_buffer, { noremap = true, silent = true, desc = "Close buffer" })
