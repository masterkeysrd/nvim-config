local trouble = require('trouble')

trouble.setup({})

vim.keymap.set("n", "<leader>xx", function()
  trouble.toggle('diagnostics')
end, { silent = true, desc = 'Trouble diagnostics' })

vim.keymap.set("n", "<leader>xq", function()
  trouble.toggle("quickfix")
end, { silent = true, desc = 'Trouble quickfix' })

vim.keymap.set("n", "<leader>xl", function()
  trouble.toggle("loclist")
end, { silent = true, desc = 'Trouble loclist' })

vim.keymap.set("n", "gR", function()
  trouble.toggle("lsp_references")
end, { silent = true, desc = 'Trouble lsp_references' })

vim.keymap.set("n", "<leader>xt", function()
  trouble.open('todo')
end, { silent = true, desc = 'Trouble todo' })
