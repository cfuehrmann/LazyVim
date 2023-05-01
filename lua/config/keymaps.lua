-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local function debug_nearest()
  if vim.bo.filetype == "cs" then
    require("neotest").run.run({
      strategy = require("neotest-dotnet.strategies.netcoredbg"),
      is_custom_dotnet_debug = true,
    })
  else
    require("neotest").run.run({ strategy = "dap" })
  end
end

local function debug_file()
  if vim.bo.filetype == "cs" then
    require("neotest").run.run({
      vim.fn.expand("%"),
      strategy = require("neotest-dotnet.strategies.netcoredbg"),
      is_custom_dotnet_debug = true,
    })
  else
    require("neotest").run.run({ strategy = "dap" })
  end
end

require("which-key").register({
  t = {
    name = "tests",
    r = {
      function()
        require("neotest").run.run()
      end,
      "Run nearest",
    },
    R = {
      function()
        require("neotest").run.run(vim.fn.expand("%"))
      end,
      "Run file",
    },
    s = {
      function()
        require("neotest").summary.toggle()
      end,
      "Toggle summary",
    },
    d = { debug_nearest, "Debug nearest" },
    D = { debug_file, "Debug file" },
  },
  prefix = "<leader>",
})
