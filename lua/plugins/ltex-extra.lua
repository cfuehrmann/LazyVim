return {
  "barreiroleo/ltex_extra.nvim",
  ft = { "markdown" },
  dependencies = { "neovim/nvim-lspconfig" },
  -- yes, you can use the opts field, just I'm showing the setup explicitly
  config = function()
    require("ltex_extra").setup({
      path = vim.fn.stdpath("config") .. "/spell",
      -- your_ltex_extra_opts,
      server_opts = {
        -- capabilities = your_capabilities,
        on_attach = function(client, bufnr)
          -- your on_attach process
        end,
        settings = {
          ltex = {
            -- your settings
          },
        },
      },
    })
  end,
}
