-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  IndentBlanklineContextStart = { bg = "NONE" },
  IndentBlanklineContextChar = { fg = "#E06C75" },
  CursorLine = { bg = "statusline_bg" },
  DiagnosticWarn = { bg = "lightbg" },
  DiagnosticError = { bg = "lightbg" },
  DiagnosticHint = { bg = "lightbg" },
  DiagnosticInformation = { bg = "lightbg" },
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {
  NvimTreeOpenedFolderName = { fg = "green", bold = true },
}

return M
