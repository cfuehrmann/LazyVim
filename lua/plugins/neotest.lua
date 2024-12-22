return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "Issafalcon/neotest-dotnet",
      "rouge8/neotest-rust",
    },
    opts = function(_, opts)
      opts.adapters = {
        require("neotest-dotnet")({}),
        require("neotest-rust")({}),
      }
    end,
  },
}
