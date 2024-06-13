local ok, lsp_zero = pcall(require, "lsp-zero")
local notify_opts = { title = "lsp-zero.nvim" }

if not ok then
  vim.notify("lsp-zero not found", vim.log.levels.ERROR, notify_opts)
  return
end

lsp_zero.preset('recommended')

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false,
  })
end)

lsp_zero.set_sign_icons({
  error = "",
  warn = "",
  hint = "",
  info = "",
})
