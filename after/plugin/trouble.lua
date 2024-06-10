local trouble = require('trouble')

trouble.setup({})
vim.keymap.set("n", "<leader>xx", function() trouble.toggle('diagnostics') end)
vim.keymap.set("n", "<leader>xq", function() trouble.toggle("quickfix") end)
vim.keymap.set("n", "<leader>xl", function() trouble.toggle("loclist") end)
vim.keymap.set("n", "gR", function() trouble.toggle("lsp_references") end)
