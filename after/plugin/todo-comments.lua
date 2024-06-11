local todo_comments = require('todo-comments')

todo_comments.setup({})

vim.keymap.set('n', ']t', function()
  todo_comments.jump_next()
end, { silent = true, desc = 'Go to next todo' })

vim.keymap.set('n', '[t', function()
  todo_comments.jump_prev()
end, { silent = true, desc = 'Go to previous todo' })
