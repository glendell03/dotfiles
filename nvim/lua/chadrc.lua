-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "pastelDark",

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

M.ui = {
  theme = "pastelDark",
  statusline = {
    theme = "minimal",
  },
  cmp = {
    style = "atom_colored",
  },
  nvdash = {
    load_on_startup = true,
  },
  ---@type Base46HLGroupsList
  -- hl_override = {
  --   Normal = {
  --     bg = "NONE",
  --     ctermbg = 0,
  --   },
  -- },
}

return M
