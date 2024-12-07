local ok, lsp_zero = pcall(require, "lsp-zero")
local notify_opts = { title = "lsp-zero.nvim" }

if not ok then
  vim.notify("lsp-zero not found", vim.log.levels.ERROR, notify_opts)
  return
end

lsp_zero.on_attach(function(_, bufnr)
  lsp_zero.default_keymaps({
    buffer = bufnr,
    preserve_mappings = false,
  })

  local keymap = vim.keymap.set

  local function opts(desc)
    return { noremap = true, silent = true, desc = desc }
  end

  -- LSP
  keymap("n", "<leader>cl", "<cmd>LspInfo<cr>", opts("Show LSP info"))
  keymap("n", "<leader>cr", vim.lsp.buf.rename, opts("Rename symbol"))
end)

lsp_zero.set_server_config({
  on_init = function(client)
    if client.name == 'gopls' and not client.server_capabilities.semanticTokensProvider then
      local semantic = client.config.capabilities.textDocument.semanticTokens
      client.server_capabilities.semanticTokensProvider = {
        full = true,
        legend = {
          tokenTypes = semantic.tokenTypes,
          tokenModifiers = semantic.tokenModifiers,
        },
        range = true,
      }
    end
  end,
})

lsp_zero.set_sign_icons({
  error = "",
  warn = "",
  hint = "",
  info = "",
})

vim.diagnostic.config({
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
})

local found_mason, mason = pcall(require, "mason")

if not found_mason then
  vim.notify("mason not found", vim.log.levels.ERROR, notify_opts)
  return
end

mason.setup({})

local found_mason_lspconfig, mason_lspconfig = pcall(require, "mason-lspconfig")

if not found_mason_lspconfig then
  vim.notify("mason-lspconfig not found", vim.log.levels.ERROR, notify_opts)
  return
end

mason_lspconfig.setup({
  ensure_installed = { "lua_ls" },
  handlers = {
    lsp_zero.default_setup,
  }
})

local lspconfig = require("lspconfig")
local cpm_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
  "force",
  {},
  vim.lsp.protocol.make_client_capabilities(),
  cpm_lsp.default_capabilities()
)

lspconfig.lua_ls.setup({
  capabilities = capabilities,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT'
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
        }
      },
      codeLens = {
        enable = true,
      },
      completion = {
        callSnippet = 'Replace',
      },
      doc = {
        privateName = { "^_" },
      },
      telemetry = {
        enable = false
      },
      hint = {
        enable = true,
        setType = false,
        paramType = true,
        paramName = true,
        semicolon = "Disable",
        arrayIndex = "Disable",
      }

    }
  }
})


lspconfig.gopls.setup({
  capabilities = capabilities,
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
      analyses = {
        fieldalignment = true,
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = true,
    }
  }
})

lspconfig.ts_ls.setup({
  capabilities = capabilities,
  settings = {
    javascript = {
      inlayHints              = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
      referencesCodeLens      = {
        enabled = true,
        showOnAllFunctions = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
    },
    typescript = {
      inlayHints              = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all",
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = true,
      },
      referencesCodeLens      = {
        enabled = true,
        showOnAllFunctions = true,
      },
      implementationsCodeLens = {
        enabled = true,
      },
    },
  },
})

lspconfig.jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas(),
      validate = { enable = true },
    },
  },
}

lspconfig.yamlls.setup({
  capabilities = capabilities,
  settings = {
    redhat = {
      telemetry = {
        enable = false
      },
    },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        enable = false,
        url = "",
      },
      schemas = require('schemastore').yaml.schemas(),
      customTags = {
        -- AWS CloudFormation
        "!And scalar",
        "!If scalar",
        "!Not scalar",
        "!Equals scalar",
        "!Or scalar",
        "!FindInMap sequence",
        "!Base64 scalar",
        "!Cidr scalar",
        "!Ref scalar",
        "!Sub scalar",
        "!GetAtt scalar",
        "!GetAZs scalar",
        "!ImportValue scalar",
        "!Select scalar",
        "!Split scalar",
        "!Join scalar",
        "!And sequence",
        "!If sequence",
        "!Not sequence",
        "!Equals sequence",
        "!Or sequence",
        "!FindInMap sequence",
        "!Base64 sequence",
        "!Cidr sequence",
        "!Ref sequence",
        "!Sub sequence",
        "!GetAtt sequence",
        "!GetAZs sequence",
        "!ImportValue sequence",
        "!Select sequence",
        "!Split sequence",
        "!Join sequence",
      },
    },
  },
})

vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
