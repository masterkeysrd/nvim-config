local ok, illuminate = pcall(require, 'illuminate')
local notify_opts = { title = 'illuminate.nvim' }

if not ok then
  vim.notify('illuminate not found', vim.log.levels.ERROR, notify_opts)
  return
end

illuminate.configure({
  providers = {
    'lsp',
    'treesitter',
    'regex',
  },
  delay = 100,
  filetype_overrides = {},
  -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
  filetypes_denylist = {
    'dirbuf',
    'dirvish',
    'fugitive',
    'help',
  },
  filetypes_allowlist = {},
  modes_denylist = {},
  modes_allowlist = {},
  providers_regex_syntax_denylist = {},
  providers_regex_syntax_allowlist = {},
  under_cursor = true,
  large_file_cutoff = nil,
  large_file_overrides = nil,
  min_count_to_highlight = 1,
  should_enable = function(_) return true end,
  case_insensitive_regex = false,
})

local keymap = vim.keymap.set

local function opts(desc, buffer)
  return { noremap = true, silent = true, desc = desc, buffer = buffer }
end

keymap('n', '[[', function()
  illuminate.goto_prev_reference(false)
end, opts('Go to previous reference'))

keymap('n', ']]', function()
  illuminate.goto_next_reference(false)
end, opts('Go to next reference'))

vim.api.nvim_create_autocmd("FileType", {
  callback = function()
    local buffer = vim.api.nvim_get_current_buf()
    keymap('n', '[[', function()
      illuminate.goto_prev_reference(false)
    end, opts('Go to previous reference', buffer))

    keymap('n', ']]', function()
      illuminate.goto_next_reference(false)
    end, opts('Go to next reference', buffer))
  end,
})
