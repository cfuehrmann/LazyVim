return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "Issafalcon/neotest-dotnet",
      "rouge8/neotest-rust",
    },
    opts = function(_, opts)
      opts.adapters = {
        require("neotest-dotnet")({}),
        require("neotest-rust")({
          args = { "--no-capture" },
          dap_adapter = "lldb",
        }),
      }
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
          function()
            require("neotest").run.run({ strategy = "dap" })
          end,
          desc = "Debug nearest",
        },
        {
          "<leader>tD",
          function()
            require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
          end,
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
