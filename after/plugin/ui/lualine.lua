local ok, lualine = pcall(require, "lualine")
local notify_opts = { title = "UI" }

if not ok then
  vim.notify("lualine.nvim not found", vim.log.levels.ERROR, notify_opts)
  return
end

local found_noice, noice = pcall(require, "noice")

local function get_cwd()
  local function get()
    local path = vim.fn.expand('%:p:h')
    local cwd = vim.fn.getcwd()
    local relative_path = path:gsub(cwd, ''):gsub('^/', ''):gsub('/$', '')
    return relative_path .. '/'
  end

  return {
    get,
    separator = "",
    padding = { left = 0, right = 0 }
  }
end

local filetype = {
  'filetype',
  icon_only = true,
  separator = "",
  padding = { left = 1, right = 0 },
}

local filename = {
  'filename',
  padding = { left = 0, right = 1 },
}

local git_symbol = {
  added = ' ',
  modified = ' ',
  removed = ' ',
}

local function diff_source()
  local gitsign = vim.b.gitsigns_status_dict

  if gitsign then
    return {
      added = gitsign.added,
      modified = gitsign.changed,
      removed = gitsign.removed,
    }
  end
end


lualine.setup({
  options = {
    theme = 'auto',
    globalstatus = true,
    disabled_filetypes = { 'dashboard', 'alpha', 'starter' },
    icons_enabled = true,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diagnostics' },
    lualine_c = { filetype, get_cwd(), filename },
    lualine_x = {
      {
        noice.api.status.message.get_hl,
        cond = function()
          return found_noice and noice.api.status.message.has()
        end,
      },
      {
        noice.api.status.command.get,
        cond = function()
          return found_noice and noice.api.status.command.has()
        end,
        color = { fg = "#ff9e64" },
      },
      {
        noice.api.status.mode.get,
        cond = function()
          return found_noice and noice.api.status.mode.has()
        end,
        color = { fg = "#ff9e64" },
      },
      {
        noice.api.status.search.get,
        cond = function()
          return found_noice and noice.api.status.search.has()
        end,
        color = { fg = "#ff9e64" },
      },
      { 'diff', symbols = git_symbol, source = diff_source }
    },
    lualine_y = {
      { 'progress', separator = " ",                  padding = { left = 1, right = 0 } },
      { 'location', padding = { left = 0, right = 1 } },
    },
    lualine_z = {
      function()
        return " " .. os.date("%R")
      end,
    },
  },
  extensions = { 'quickfix', 'fugitive', 'fzf', 'mason', 'nvim-tree', 'toggleterm', 'trouble' },
})
