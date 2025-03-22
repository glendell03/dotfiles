require "nvchad.options"

-- add yours here!

local o = vim.o
local opt = vim.opt
local g = vim.g

g.context_enabled = 1

-- o.cursorlineopt = "both" -- to enable cursorline!
o.pumheight = 10

opt.relativenumber = true
opt.laststatus = 3

vim.api.nvim_set_hl(0, "DiffAdd", { bg = "#2B3B34", fg = "#A6E3A1" }) -- darker green background, soft green text
vim.api.nvim_set_hl(0, "DiffDelete", { bg = "#3F1D2E", fg = "#E78284" }) -- dark red/pink background, muted red/pink text
vim.api.nvim_set_hl(0, "DiffChange", { bg = "#3B3328", fg = "#E5C890" }) -- dark yellow/brown background, muted yellow text
vim.api.nvim_set_hl(0, "DiffText", { bg = "#2C3A4B", fg = "#8AADF4" }) -- dark blue background, muted blue text

if g.neovide then
  o.guifont = "JetBrainsMono Nerd Font:h16:b"
  -- g.neovide_scale_factor = 1.2

  g.neovide_refresh_rate = 60
  g.neovide_no_idle = true
  g.neovide_refresh_rate_idle = 5
  g.neovide_confirm_quit = true
  g.neovide_remember_window_size = true
end
