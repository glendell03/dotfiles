-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "pastelDark",

  hl_override = {
    DiffDelete = {
      bg = "#5A424D",
      blend = 50,
      fg = "NONE",
    },
    DiffAdd = {
      bg = "#45504F",
      blend = 50,
      fg = "NONE",
    },
    DiffChange = {
      bg = "#54524F",
      fg = "NONE",
    },
    DiffText = {
      bg = "#706955",
    },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.ui = {
  theme = "pastelDark",
  statusline = {
    theme = "minimal",
    separator_style = "round",
  },
  cmp = {
    icons_left = true,
    style = "flat_dark",
  },
  -- nvdash = {
  --   load_on_startup = true,
  -- },
  ---@type Base46HLGroupsList
  hl_override = {
    DiffDelete = {
      bg = "#5A424D",
      fg = "NONE",
    },
    DiffAdd = {
      bg = "#45504F",
      fg = "NONE",
    },
    DiffChange = {
      bg = "#54524F",
      fg = "NONE",
    },
    DiffText = {
      bg = "#706955",
    },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    Normal = {
      bg = "NONE",
      ctermbg = 0,
    },
  },
}

return M
