local lsp = require('lsp-zero')

lsp.preset('recommend')

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
	'ast_grep',
	'bashls',
	'clangd',
	'cssls',
	'dockerls',
	'docker_compose_language_service',
	'eslint',
	'gopls',
	'tsserver',
	'html',
	'lua_ls',
	'marksman',
	'spectral',
	'pyright',
	'sqlls',
	'yamlls',
  },
  automatic_installation = true,
  handlers = {
    lsp.default_setup,
  },
})
