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

      vim.notify("Setting up " .. server_name, vim.log.levels.INFO, notify_opts)
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
  settings = {
    Lua = {}
  }
})
