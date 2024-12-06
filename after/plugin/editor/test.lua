local ok, neotest = pcall(require, "neotest")
local notify_options = { title = "neotest.nvim" }

if not ok then
  vim.notify("neotest.nvim not found", vim.log.levels.ERROR, notify_options)
  return
end

local neotest_ns = vim.api.nvim_create_namespace("neotest")
vim.diagnostic.config({
  virtual_text = {
    format = function(diagnostic)
      -- Replace newline and tab characters with space for more compact diagnostics
      local message = diagnostic.message:gsub("\n", " "):gsub("\t", " "):gsub("%s+", " "):gsub("^%s+", "")
      return message
    end,
  },
}, neotest_ns)

neotest.setup({
  adapters = {
    require("neotest-go")({
      recursive_run = true,
      experimental = {
        test_table = true,
      },
    }),
  },
  status = {
    virtual_text = true,
  },
  output = {
    open_on_run = true,
  },
  quickfix = {
    enable = true,
    open = function()
      local trouble_ok, trouble = pcall(require, "trouble")

      if trouble_ok then
        trouble.open({ mode = "quickfix", focus = false })
      else
        vim.cmd("copen")
      end
    end
  },
  consumers = {
    trouble = function(client)
      local trouble_ok, trouble = pcall(require, "trouble")

      if not trouble_ok then
        return
      end

      client.listeners.results = function(adapter_id, results, partial)
        if partial then
          return
        end

        local tree = assert(client:get_position(nil, { adapter = adapter_id }))

        local failed = 0
        for pos_id, result in pairs(results) do
          if result.status == "failed" and tree:get_key(pos_id) then
            failed = failed + 1
          end
        end

        vim.schedule(function()
          if trouble.is_open() then
            trouble.refresh()
            if failed == 0 then
              trouble.close()
            end
          end
        end)
        return {}
      end
    end
  }
})


local keymap = vim.keymap.set

local function opts(desc)
  return { noremap = true, silent = true, desc = desc }
end

local keys = {
  { "<leader>t",  "",                                                                                 desc = "+test" },
  { "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end,                      desc = "Run File" },
  { "<leader>tT", function() require("neotest").run.run(vim.fn.getcwd()) end,                         desc = "Run All Test Files" },
  { "<leader>tr", function() require("neotest").run.run() end,                                        desc = "Run Nearest" },
  { "<leader>tr", function() require("neotest").run.run({ strategy = "dap" }) end,                    desc = "Debug Nearest Test" },
  { "<leader>tl", function() require("neotest").run.run_last() end,                                   desc = "Run Last" },
  { "<leader>ts", function() require("neotest").summary.toggle() end,                                 desc = "Toggle Summary" },
  { "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end, desc = "Show Output" },
  { "<leader>tO", function() require("neotest").output_panel.toggle() end,                            desc = "Toggle Output Panel" },
  { "<leader>tS", function() require("neotest").run.stop() end,                                       desc = "Stop" },
  { "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,                 desc = "Toggle Watch" },
}

for _, key in ipairs(keys) do
  keymap("n", key[1], key[2], opts(key.desc))
end
