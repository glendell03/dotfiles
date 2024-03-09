-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })

if vim.g.neovide then
  -- Put anything you want to happen only in Neovide here
  vim.o.guifont = "JetBrainsMono Nerd Font:h13"
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_cursor_animate_command_line = false
  vim.g.neovide_input_macos_alt_is_meta = true
  -- vim.opt.linespace = 4
end

vim.opt.relativenumber = true
vim.opt.list = true
vim.o.pumheight = 10

vim.diagnostic.config {
  -- virtual_text = false,
  float = {
    border = "single",
    show_header = false,
    header = "",
    source = "always",
  },
}

vim.api.nvim_set_keymap("n", "<m-d>", "<cmd>RustOpenExternalDocs<Cr>", { noremap = true, silent = true })

vim.g.rainbow_delimiters = {
  query = {
    javascript = "rainbow-parens",
    tsx = "rainbow-parens",
  },
  highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
  },
}

-- local highlight = {
--   "RainbowRed",
--   "RainbowYellow",
--   "RainbowBlue",
--   "RainbowOrange",
--   "RainbowGreen",
--   "RainbowViolet",
--   "RainbowCyan",
-- }
--
-- local hooks = require "ibl.hooks"
-- -- create the highlight groups in the highlight setup hook, so they are reset
-- -- every time the colorscheme changes
-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
-- vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
-- vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
-- vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
-- vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
-- vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
-- end)
--
-- require("ibl").setup { indent = { highlight = highlight } }

vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#ef8891" })
vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#fbdf90" })
-- vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#99aee5" })
vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#EDA685" })
vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#9fe8c3" })
vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#c2a2e3" })
-- vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#b5c3ea" })

vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeClose", { clear = true }),
  pattern = "NvimTree_*",
  callback = function()
    local layout = vim.api.nvim_call_function("winlayout", {})
    if
      layout[1] == "leaf"
      and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree"
      and layout[3] == nil
    then
      vim.cmd "confirm quit"
    end
  end,
})
