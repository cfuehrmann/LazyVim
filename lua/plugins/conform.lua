-- CSharpier stopped working with LazyVim, and this fixed it
-- The reason was probably that the the global shim changed
-- its name and maybe args.
return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  opts = {
    formatters_by_ft = {
      cs = { "csharpier" },
    },
    formatters = {
      csharpier = {
        command = "csharpier", -- the global shim
        args = { "format" }, -- the new subcommand
        stdin = true, -- pipe buffer in
      },
    },
  },
}
