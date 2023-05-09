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

return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
    },
    opts = function(_, opts)
      opts.adapters = { require("neotest-dotnet")({}) }
    end,
    keys = function()
      return {
        {
          "<leader>tr",
          function()
            require("neotest").run.run()
          end,
          desc = "Run nearest",
        },
        {
          "<leader>tR",
          function()
            require("neotest").run.run(vim.fn.expand("%"))
          end,
          desc = "Run file",
        },
        {
          "<leader>td",
          debug_nearest,
          desc = "Debug nearest",
        },
        {
          "<leader>tD",
          debug_file,
          desc = "Debug file",
        },
        {
          "<leader>ts",
          function()
            require("neotest").summary.toggle()
          end,
          desc = "Toggle summary",
        },
      }
    end,
  },
}
