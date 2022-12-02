local M = {}

M.disabled = {
  n = {
    ["<leader>d"] = "",
    ["<leader>q"] = "",
  },
}

M.trouble = {
  n = {
    ["<leader>t"] = { "<cmd> TroubleToggle <CR>", "Open Toggle" },
  },
}

M.yank = {
  n = {
    ["<leader>y"] = { '"+y' },
  },
}

M.delete = {
  n = {
    ["<leader>d"] = { '"_d' },
  },
}

-- M.nvimtree = {
--   n = {
--     ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle Nvimtree" },
--   },
-- }

M.minimap = {
  n = {
    ["<C-x>"] = { "<cmd> MinimapToggle <CR>", "Minimap Toggle" },
  },
}

M.gitblame = {
  n = {
    ["<C-g>"] = { "<cmd> GitBlameToggle <CR>", "Git Blame Toggle" },
  },
}

M.move = {
  n = {
    ["<S-Up>"] = { "<cmd> m-2 <CR>", "Move Line Up" },
    ["<S-Down>"] = { "<cmd> m+ <CR>", "Move Down Up" },
    ["<leader>q"] = { "<cmd> q <CR>", "quit" },
  },
}

M.telescope = {
  n = {
    ["<leader>ft"] = { "<cmd> Telescope grep_string <CR>", "Find Text" },
    ["<leader>fg"] = { "<cmd> Telescope live_grep <CR>", "Find Text" },
  },
}

return M
