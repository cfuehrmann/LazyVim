return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      local dap = require("dap")

      -- Neotest-dotnet seems hardwired to use an adapter named "netcoredbg".
      -- The dap.configuration has a choosable "type", which we choose to
      -- point to this adapter too.

      dap.adapters.netcoredbg = {
        type = "executable",
        command = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/netcoredbg"),
        args = { "--interpreter=vscode" },
      }

      dap.configurations.cs = {
        {
          type = "netcoredbg",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input({
              prompt = "Path to dll: ",
              default = vim.fn.getcwd() .. "/",
              completion = "file",
            })
          end,
        },
      }
    end,
  },
}
