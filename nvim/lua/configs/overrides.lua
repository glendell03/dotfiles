local M = {}

M.nvimtree = {
  view = {
    side = "right",
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

M.cmp = {
  experimental = {
    ghost_text = { hlgroup = "Comment" },
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "codeium" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

return M
