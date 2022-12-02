-- First read our docs (completely) then check the example_config repo
local pluginConfs = require "custom.plugins.configs"

local M = {}

M.ui = {
  theme = "catppuccin",
  -- transparency = true,
}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["nvim-telescope/telescope.nvim"] = pluginConfs.telescope
  },
}

M.mappings = require "custom.mappings"

return M
