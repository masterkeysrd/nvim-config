local ok, dap = pcall(require, 'dap')
local notify_ops = { title = 'dap.nvim' }

if not ok then
  vim.notify('dap not found', vim.log.levels.ERROR, notify_ops)
  return
end

local keymap = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local function get_args()
  local args = vim.fn.input('Arguments: ')
  return vim.split(args, ' ')
end

keymap('n', '<leader>dB', function()
  dap.set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, opts('Breakpoint Condition'))
keymap('n', '<leader>db', function()
  dap.toggle_breakpoint()
end, opts('Toggle Breakpoint'))
keymap('n', '<leader>dc', function()
  dap.continue()
end, opts('Continue'))
keymap('n', '<leader>da', function()
  dap.continue({ before = get_args })
end, opts('Run with Args'))
keymap('n', '<leader>dC', function()
  dap.run_to_cursor()
end, opts('Run to Cursor'))
keymap('n', '<leader>dg', function()
  dap.goto_()
end, opts('Go to Line (No Execute)'))
keymap('n', '<leader>di', function()
  dap.step_into()
end, opts('Step Into'))
keymap('n', '<leader>dj', function()
  dap.down()
end, opts('Down'))
keymap('n', '<leader>dk', function()
  dap.up()
end, opts('Up'))
keymap('n', '<leader>dl', function()
  dap.run_last()
end, opts('Run Last'))
keymap('n', '<leader>do', function()
  dap.step_out()
end, opts('Step Out'))
keymap('n', '<leader>dO', function()
  dap.step_over()
end, opts('Step Over'))
keymap('n', '<leader>dp', function()
  dap.pause()
end, opts('Pause'))
keymap('n', '<leader>dr', function()
  dap.repl.toggle()
end, opts('Toggle REPL'))
keymap('n', '<leader>ds', function()
  dap.session()
end, opts('Session'))
keymap('n', '<leader>dt', function()
  dap.terminate()
end, opts('Terminate'))
keymap('n', '<leader>dw', function()
  dap.ui.widgets.hover()
end, opts('Widgets'))


vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

local function set_up_dap_ui()
  local dap_ui_ok, dap_ui = pcall(require, 'dapui')

  if not dap_ui_ok then
    vim.notify('dapui not found', vim.log.levels.ERROR, notify_ops)
    return
  end

  dap_ui.setup()

  dap.listeners.before.attach.dapui_config = function()
    dap_ui.open()
  end
  dap.listeners.before.launch.dapui_config = function()
    dap_ui.open()
  end
  dap.listeners.before.event_terminated.dapui_config = function()
    dap_ui.close()
  end
  dap.listeners.before.event_exited.dapui_config = function()
    dap_ui.close()
  end

  keymap('n', '<leader>du', function()
    dap_ui.toggle()
  end, opts('Toggle DAP UI'))
  keymap('n', '<leader>de', function()
    dap_ui.eval()
  end, opts('Evaluate'))
end

local function setup_virtual_text()
  local dap_virtual_text_ok, dap_virtual_text = pcall(require, 'nvim-dap-virtual-text')

  if not dap_virtual_text_ok then
    vim.notify('nvim-dap-virtual-text not found', vim.log.levels.ERROR, notify_ops)
    return
  end

  dap_virtual_text.setup()
end

local function setup_mason()
  local mason_dap_ok, mason_dap = pcall(require, 'mason-nvim-dap')

  if not mason_dap_ok then
    vim.notify('mason-nvim-dap not found', vim.log.levels.ERROR, notify_ops)
    return
  end

  mason_dap.setup({
    automatic_installation = true,
    handlers = {},
    ensure_installed = {},
  })
end

local function setup_go()
  local dap_go_ok, dap_go = pcall(require, 'dap-go')

  if not dap_go_ok then
    vim.notify('dap-go not found', vim.log.levels.ERROR, notify_ops)
    return
  end

  dap_go.setup()
end

set_up_dap_ui()
setup_virtual_text()
setup_mason()
setup_go()
