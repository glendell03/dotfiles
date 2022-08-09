local pluginConfs = require "custom.plugins.configs"
-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "catppuccin",
  transparency = true,
}

M.plugins = {
  user = require "custom.plugins",
  override = {
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["lukas-reineke/indent-blankline.nvim"] = pluginConfs.indentBlankline,
  },
}

return M
