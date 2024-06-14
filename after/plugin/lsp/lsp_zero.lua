local ok, lsp_zero = pcall(require, "lsp-zero")
local notify_opts = { title = "lsp-zero.nvim" }

if not ok then
  vim.notify("lsp-zero not found", vim.log.levels.ERROR, notify_opts)
  return
end

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false,
  })

  local keymap = vim.keymap.set

  local function opts(desc)
    return { noremap = true, silent = true, desc = desc }
  end

  -- LSP
  keymap("n", "<leader>cl", "<cmd>LspInfo<cr>", opts("Show LSP info"))
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts("Show code actions"))
  keymap("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))
end)

lsp_zero.set_sign_icons({
  error = "",
  warn = "",
  hint = "",
  info = "",
})
