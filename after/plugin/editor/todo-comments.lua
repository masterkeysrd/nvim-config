local todo_comments = require('todo-comments')

todo_comments.setup({})

local function opts(desc)
  return { silent = true, desc = desc }
end

vim.keymap.set('n', ']t', todo_comments.jump_next, opts('Go to next todo'))
vim.keymap.set('n', '[t', todo_comments.jump_prev, opts('Go to previous todo'))
