local ok, cmp = pcall(require, 'cmp')
local notify_opts = { title = 'cmp.nvim' }

if not ok then
  vim.notify('nvim-cmp not found', vim.log.levels.ERROR, notify_opts)
  return
end

local defaults = require('cmp.config.default')()

local cmp_kinds = {
  Text = '',
  Method = '',
  Function = '',
  Constructor = '',
  Field = '',
  Variable = '',
  Class = '',
  Interface = '',
  Module = '',
  Property = '',
  Unit = '',
  Value = '',
  Enum = '',
  Keyword = '',
  Snippet = '',
  Color = '',
  File = '',
  Reference = '',
  Folder = '',
  EnumMember = '',
  Constant = '',
  Struct = '',
  Event = '',
  Operator = '',
  TypeParameter = '',
}

local function confirm(fallback)
  local opts = { behavior = cmp.ConfirmBehavior.Replace, select = true }

  if cmp.core.view:visible() or vim.fn.pumvisible() == 1 then
    if cmp.confirm(opts) then
      return
    end
  end

  return fallback()
end

cmp.setup({
  autobrackts = {}, -- configure any file type to add auto brackets
  completion = {
    completeopt = 'menu,menuone,noinsert',
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ['<C-j>'] = cmp.mapping.scroll_docs(-4),
    ['<C-k>'] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = confirm,
  }),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'nvim_lua' },
    { name = 'path' },
    { name = 'git' },
  }, { name = 'buffer' }),
  formatting = {
    fields = { 'kind', 'abbr' },
    format = function(_, vim_item)
      vim_item.kind = cmp_kinds[vim_item.kind] or ''
      return vim_item
    end,
  },
  sorting = defaults.sorting,
})

cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

local set_highligh = vim.api.nvim_set_hl

-- light-grey
set_highligh(0, 'CmpItemAbbr', { bg = 'NONE', fg = '#EBEBEB' })
-- gray
set_highligh(0, 'CmpItemAbbrDeprecated', { bg = 'NONE', strikethrough = true, fg = '#808080' })
-- blue
set_highligh(0, 'CmpItemAbbrMatch', { bg = 'NONE', fg = '#569CD6' })
set_highligh(0, 'CmpItemAbbrMatchFuzzy', { link = 'CmpIntemAbbrMatch' })
--  ligh blue
set_highligh(0, 'CmpItemKindVariable', { bg = 'NONE', fg = '#9CDCFE' })
set_highligh(0, 'CmpItemKindInterface', { link = 'CmpItemKindVariable' })
set_highligh(0, 'CmpItemKindText', { link = 'CmpItemKindVariable' })
-- pink
set_highligh(0, 'CmpItemKindFunction', { bg = 'NONE', fg = '#C586C0' })
set_highligh(0, 'CmpItemKindMethod', { link = 'CmpItemKindFunction' })
-- front
set_highligh(0, 'CmpItemKindKeyword', { bg = 'NONE', fg = '#D4D4D4' })
set_highligh(0, 'CmpItemKindProperty', { link = 'CmpItemKindKeyword' })
set_highligh(0, 'CmpItemKindUnit', { link = 'CmpItemKindKeyword' })
-- ghost
set_highligh(0, "CmpGhostText", { link = "Comment", default = true })
