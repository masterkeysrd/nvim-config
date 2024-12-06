local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local finders = require("telescope.finders")

local themes = require("telescope.themes")
local pickers = require("telescope.pickers")
local conf = require("telescope.config").values

local notify_opts = { title = "Code Actions" }

local M = {}

local function get_code_actions()
  local bufnr = vim.api.nvim_get_current_buf()
  local params = vim.lsp.util.make_range_params()

  params.context = {
    triggerKind = vim.lsp.protocol.CodeActionTriggerKind.Invoked,
    diagnostics = vim.lsp.diagnostic.get_line_diagnostics()
  }

  local response = vim.lsp.buf_request_sync(bufnr, "textDocument/codeAction", params, 1000)

  if not response or vim.tbl_isempty(response) then
    vim.notify("No code actions available", vim.log.levels.INFO, notify_opts)
    return
  end

  local results = nil

  if response and response[1] then
    results = response[1].result
  end

  if not results and response and response[2] then
    results = response[2].result
  end

  if not results then
    vim.notify("No code actions available", vim.log.levels.INFO, notify_opts)
    return
  end

  return results
end

function M.actions(opts)
  opts = opts or themes.get_dropdown()

  local results = get_code_actions()

  if not results then
    return
  end

  pickers.new(opts, {
    prompt_title = "Code Actions",
    finder = finders.new_table {
      results = results,
      entry_maker = function(entry)
        return {
          value = entry,
          display = entry.title,
          ordinal = entry.title,
        }
      end,
    },
    sorter = conf.generic_sorter({}),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection then
          if selection.value.edit then
            vim.lsp.util.apply_workspace_edit(selection.value.edit, 'utf-8')
          else
            vim.lsp.buf.execute_command(selection.value.command)
          end
        end
      end)
      return true
    end,
  }):find()
end

return M
