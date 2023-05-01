-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

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
  },
  prefix = "<leader>",
})
