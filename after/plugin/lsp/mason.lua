local found_mason, mason = pcall(require, "mason")
local notify_opts = { title = "mason.nvim" }

if not found_mason then
  vim.notify("mason not found", vim.log.levels.ERROR, notify_opts)
  return
end

mason.setup({})

local found_mason_lsp, mason_lsp = pcall(require, "mason-lspconfig")

if not found_mason_lsp then
  vim.notify("mason-lspconfig not found", vim.log.levels.ERROR, notify_opts)
  return
end

mason_lsp.setup({
  ensure_installe = {},
  handlers = {
    function(server_name)
      local ok, lspconfig = pcall(require, "lspconfig")
      if not ok then
        vim.notify("lspconfig not found", vim.log.levels.ERROR, notify_opts)
        return
      end

      lspconfig[server_name].setup({})
    end,
  }
})

local found_lspconfig, lspconfig = pcall(require, "lspconfig")

if not found_lspconfig then
  vim.notify("lspconfig not found", vim.log.levels.ERROR, notify_opts)
  return
end

lspconfig.lua_ls.setup({
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
        paramName = "Disable",
        semicolon = "Disable",
        arrayIndex = "Disable",
      }

    }
  }
})

vim.keymap.set("n", "<leader>cm", "<cmd>Mason<cr>", { noremap = true, silent = true, desc = "Mason" })
