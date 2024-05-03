local lsp = require('lsp-zero')

lsp.preset('recommend')

lsp.on_attach(function(_, bufnr)
  lsp.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  automatic_installation = true,
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end
  }
})
