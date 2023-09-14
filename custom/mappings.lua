---@type MappingsTable
local M = {}

M.disabled = {
  n = {
    ["<C-n>"] = "",
    ["<leader>rn"] = "",
  },
}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<S-Up>"] = { ":m-2<CR>", opts = { nowait = true } },
    ["<S-Down>"] = { ":m+<CR>", opts = { nowait = true } },
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "toggle transparency",
    },
    ["<leader>fs"] = {
      function()
        vim.lsp.buf.format {
          range = {
            ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
            ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
          },
        }
      end,
      opts = { nowait = true },
    },
  },
}

M.diffview = {
  n = {
    ["<leader>go"] = { ":DiffviewOpen<cr>", "Open Diffview", opts = { nowait = true } },
    ["<leader>gc"] = { ":DiffviewClose<cr>", "Close Diffview", opts = { nowait = true } },
    ["<leader>gv"] = { ":DiffviewToggleFiles<cr>", "Toggle Files Diffview", opts = { nowait = true } },
    ["<leader>gf"] = { ":DiffviewFocusFiles<cr>", "Focus Files Diffview", opts = { nowait = true } },
    ["<leader>gr"] = { ":DiffviewRefresh<cr>", "Refresh Diffview", opts = { nowait = true } },
  },
}

M.tabufline = {
  n = {
    ["<C-t>"] = { ":tabnew<CR>", opts = { nowait = true } },
    ["<C-tn>"] = { ":tabnext<CR>", opts = { nowait = true } },
    ["<S-t>"] = { ":tabclose<CR>", opts = { nowait = true } },
  },
}

M.rust = {
  n = {
    ["<leader>rr"] = { "<cmd>RustRunnables<Cr>", "Runnables", opts = { nowait = true } },
    ["<leader>rt"] = { "<cmd>lua _CARGO_TEST()<cr>", "Cargo Test", opts = { nowait = true } },
    ["<leader>rm"] = { "<cmd>RustExpandMacro<Cr>", "Expand Macro", opts = { nowait = true } },
    ["<leader>rc"] = { "<cmd>RustOpenCargo<Cr>", "Open Cargo", opts = { nowait = true } },
    ["<leader>rp"] = { "<cmd>RustParentModule<Cr>", "Parent Module", opts = { nowait = true } },
    ["<leader>rd"] = { "<cmd>RustDebuggables<Cr>", "Debuggables", opts = { nowait = true } },
    ["<leader>rv"] = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph", opts = { nowait = true } },
    ["<leader>rR"] = {
      "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
      "Reload Workspace",
      opts = { nowait = true },
    },
    ["<leader>ro"] = { "<cmd>RustOpenExternalDocs<Cr>", "Open External Docs", opts = { nowait = true } },
    ["<leader>ry"] = {
      "<cmd>lua require'crates'.open_repository()<cr>",
      "[crates] open repository",
      opts = { nowait = true },
    },
    ["<leader>rP"] = { "<cmd>lua require'crates'.show_popup()<cr>", "[crates] show popup", opts = { nowait = true } },
    ["<leader>ri"] = {
      "<cmd>lua require'crates'.show_crate_popup()<cr>",
      "[crates] show info",
      opts = { nowait = true },
    },
    ["<leader>rf"] = {
      "<cmd>lua require'crates'.show_features_popup()<cr>",
      "[crates] show features",
      opts = { nowait = true },
    },
    ["<leader>rD"] = {
      "<cmd>lua require'crates'.show_dependencies_popup()<cr>",
      "[crates] show dependencies",
      opts = { nowait = true },
    },
  },
}

-- more keybinds!

return M
