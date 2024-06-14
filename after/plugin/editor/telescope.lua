local ok_telescope, telescope = pcall(require, 'telescope')
local notify_opts = { title = 'telescope.nvim' }

if not ok_telescope then
  vim.notify('telescope.nvim not found', vim.log.levels.ERROR, notify_opts)
  return
end

local ok_builtin, builtin = pcall(require, 'telescope.builtin')
if not ok_builtin then
  vim.notify('telescope.builtin not found', vim.log.levels.ERROR, notify_opts)
  return
end

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

local map = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end


map('n', '<C-p>', builtin.find_files, opts('Find files'))
map('n', '<leader>pf', builtin.find_files, opts('Find files'))
map('n', '<leader>ps', builtin.live_grep, opts('Live grep'))
map('n', '<leader>pb', builtin.buffers, opts('Buffers'))
map('n', '<leader>ph', builtin.help_tags, opts('Help tags'))
map('n', '<leader>po', builtin.oldfiles, opts('Old files'))
map('n', '<leader>ca', require('masterkeysrd.telescope.code').actions, opts('Code actions'))

map('n', 'Pr', builtin.lsp_references, opts('Peek references'))
map('n', 'Pd', builtin.lsp_definitions, opts('Peek definitions'))
map('n', 'Pi', builtin.lsp_implementations, opts('Peek implementations'))
