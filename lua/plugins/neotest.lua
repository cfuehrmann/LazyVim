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
          dap_adapter = "codelldb",
        }),
      }
    end,
  },
}
