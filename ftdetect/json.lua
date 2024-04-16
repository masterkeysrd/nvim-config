
vim.api.nvim_create_autocmd("BufWinEnter", {
    pattern = "*.json.tmpl",
    command = "set filetype=json",
})
