-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.number = false
opt.relativenumber = true

if vim.g.neovide then
  vim.o.guifont = "JetBrains Mono,Symbols Nerd Font Mono,Noto Color Emoji:h11"
end
