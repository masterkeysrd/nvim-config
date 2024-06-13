local lsp = require('lsp-zero')
local map = vim.keymap.set

lsp.preset('recommend')

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({
  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    }
  }
})

require('mason-lspconfig').setup({
  ensure_installed = {
    'lua_ls',
    'vimls',
  },
  automatic_installation = true,
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end
  }
})

require('lspconfig').lua_ls.setup({
  on_init = function(client)
    local path = client.workspace_folders[1].name
    if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
      return
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      }
    })
  end,
  diagnostic = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = 'if_many',
      prefix = ''
    },
    severity_sort = true,
  },
  document_highlight = {
    enable = true
  },
  capabilities = {
    workspace = {
      fileOperations = {
        didRename = true,
        willRename = true
      },
    },
  },
  settings = {
    Lua = {}
  }
})

require('lspconfig').pbls.setup({})
