local telescope = require('telescope')
local builtin = require('telescope.builtin')

telescope.setup({
  defaults = {
    file_ignore_patterns = {
      ".git",
      ".yarn",
      "node_modules",
      "vendor"
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--trim",
      '--hidden',
      '--no-ignore',
      '--glob',
      '!**/.git/*'
    },
  },
  pickers = {
    find_files = {
      find_command = {
        'rg',
        '--files',
        '--hidden',
        '--no-ignore',
        '--glob',
        '!**/.git/*'
      }
    }
  },


  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
})

telescope.load_extension('fzf')

vim.keymap.set('n', '<C-p>', function()
  builtin.find_files()
end, { silent = true, desc = 'Find files' })

vim.keymap.set('n', '<leader>pf', function()
  builtin.find_files()
end, { silent = true, desc = 'Find files' })

vim.keymap.set('n', '<leader>ps', function()
  builtin.live_grep()
end, { silent = true, desc = 'Live grep' })

vim.keymap.set('n', '<leader>pb', function()
  builtin.buffers()
end, { silent = true, desc = 'Buffers' })

vim.keymap.set('n', '<leader>ph', function()
  builtin.help_tags()
end, { silent = true, desc = 'Help tags' })

vim.keymap.set('n', 'Pr', function()
  builtin.lsp_references()
end, { silent = true, desc = 'Peek references' })

vim.keymap.set('n', 'Pd', function()
  builtin.lsp_definitions()
end, { silent = true, desc = 'Peek definitions' })

vim.keymap.set('n', 'Pi', function()
  builtin.lsp_implementations()
end, { silent = true, desc = 'Peek implementations' })
