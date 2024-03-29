---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "pastelDark",
  theme_toggle = { "pastelDark", "pastelDark" },
  transparency = false,
  hl_override = highlights.override,
  hl_add = highlights.add,
  statusline = {
    theme = "minimal",
  },
  cmp = {
    style = "atom_colored",
  },

  nvdash = {
    load_on_startup = true,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
