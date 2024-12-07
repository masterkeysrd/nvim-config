-- Creates Q commands to avoid the error when typed by mistake
vim.api.nvim_create_user_command("Q", "q", { bang = true, nargs = 0 })
vim.api.nvim_create_user_command("Qa", "qa", { bang = true, nargs = 0 })
vim.api.nvim_create_user_command("Qall", "qall", { bang = true, nargs = 0 })
