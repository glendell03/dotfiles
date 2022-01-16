--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT

-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"
vim.wo.relativenumber = true
lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.treesitter.rainbow = {enable = true}

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = false
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- we use protected-mode (pcall) just in case the plugin wasn't loaded yet.
-- local _, actions = pcall(require, "telescope.actions")
-- lvim.builtin.telescope.defaults.mappings = {
--   -- for input mode
--   i = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--     ["<C-n>"] = actions.cycle_history_next,
--     ["<C-p>"] = actions.cycle_history_prev,
--   },
--   -- for normal mode
--   n = {
--     ["<C-j>"] = actions.move_selection_next,
--     ["<C-k>"] = actions.move_selection_previous,
--   },
-- }

-- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "+Trouble",
  r = { "<cmd>Trouble lsp_references<cr>", "References" },
  f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
  d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Diagnostics" },
}

lvim.builtin.which_key.mappings["r"] = { "<cmd>RnvimrToggle<CR>", "Ranger" }

lvim.builtin.which_key.mappings["v"] = {
  name = "+Diffview",
  o = {"<cmd>DiffviewOpen<cr>", "Open"},
  c = {"<cmd>DiffviewClose<cr>", "Close"},
  t = {"<cmd>DiffviewToggleFiles<cr>", "Toggle Files"},
  f = {"<cmd>DiffviewFocusFiles<cr>", "Focus Files"},
  r = {"<cmd>DiffviewRefresh<cr>", "Refresh"}
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.dashboard.active = true
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.ignore = {".git", "node_modules", ".cache"}
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.git_hl = 1
lvim.builtin.nvimtree.setup.auto_open = 1
lvim.builtin.nvimtree.setup.auto_close = 1
lvim.builtin.nvimtree.quit_on_open = 1
lvim.builtin.nvimtree.setup.tab_open = 1


-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- ---@usage disable automatic installation of servers
-- lvim.lsp.automatic_servers_installation = false

-- ---@usage Select which servers should be configured manually. Requires `:LvimCacheRest` to take effect.
-- See the full default list `:lua print(vim.inspect(lvim.lsp.override))`
-- vim.list_extend(lvim.lsp.override, { "pyright" })

-- ---@usage setup a server -- see: https://www.lunarvim.org/languages/#overriding-the-default-configuration
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pylsp", opts)

-- you can set a custom on_attach function that will be used for all the language servers
-- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end
-- you can overwrite the null_ls setup table (useful for setting the root_dir function)
-- lvim.lsp.null_ls.setup.root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules")
-- or if you need something more advanced
-- lvim.lsp.null_ls.setup.root_dir = function(fname)
--   if vim.bo.filetype == "javascript" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "node_modules")(fname)
--       or require("lspconfig/util").path.dirname(fname)
--   elseif vim.bo.filetype == "php" then
--     return require("lspconfig/util").root_pattern("Makefile", ".git", "composer.json")(fname) or vim.fn.getcwd()
--   else
--     return require("lspconfig/util").root_pattern("Makefile", ".git")(fname) or require("lspconfig/util").path.dirname(fname)
--   end
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { exe = "black", filetypes = { "python" } },
  {
    exe = "prettierd",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    -- args = { "--print-with", "100" },
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { exe = "flake8", filetypes = { "python" } },
  {
    exe = "eslint",
    ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
}

require'lspconfig'.tailwindcss.setup{
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)", -- tw`...`
          "tw=\"([^\"]*)", -- <div tw="..." />
          "tw={\"([^\"}]*)", -- <div tw={"..."} />
          "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
          "tw\\(.*?\\)`([^`]*)"
        }
      }
    }
  }
}

-- Additional Plugins
lvim.plugins = {
    -- {"olimorris/onedarkpro.nvim",
    --   require('onedarkpro').setup({
    --     options = {
    --       transparency = true,
    --       terminal_colors = true
    --     }
    --   })
    -- },
    {"joshdick/onedark.vim"},
    {"kevinhwang91/rnvimr"},
    {"sindrets/diffview.nvim",
      requires = "nvim-lua/plenary.nvim",
      require('diffview').setup()
    },
    {"windwp/nvim-ts-autotag",
      config = function ()
        require('nvim-ts-autotag').setup {
          autotag = {
            enable = true,
          }
      }
      end
    },
    {"f-person/git-blame.nvim"},
    {"p00f/nvim-ts-rainbow",
      config = function ()
        require("nvim-treesitter.configs").setup {
          highlight = {
              -- ...
          },
          -- ...
          rainbow = {
            enable = true,
            -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            -- colors = {}, -- table of hex strings
            -- termcolors = {} -- table of colour name strings
          }
       }
      end
    },
    {"norcalli/nvim-colorizer.lua",
      config = function ()
        require "colorizer".setup {
          "*";
          css = {css = true},
          javascript = {css = true}
        }
    end
    },
    -- {
    --   "Pocco81/AutoSave.nvim",
    --   config = function()
    --     require("autosave").setup()
    --   end,
    -- },
    {
      "lukas-reineke/indent-blankline.nvim",
      event = "BufRead",
      config = function ()
      -- vim.opt.termguicolors = true
      -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent4 guifg=#00A19d blend=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
      -- vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

      -- vim.opt.listchars = {
      --     space = "⋅",
      --     eol = "↴",
      -- }

      -- require("indent_blankline").setup {
      --     space_char_blankline = " ",
      --     char_highlight_list = {
      --         "IndentBlanklineIndent1",
      --         "IndentBlanklineIndent2",
      --         "IndentBlanklineIndent3",
      --         "IndentBlanklineIndent4",
      --         "IndentBlanklineIndent5",
      --         "IndentBlanklineIndent6",
      --     },
      -- }

      vim.opt.list = true
      -- vim.opt.listchars:append("space:⋅")
      -- vim.opt.listchars:append("eol:↴")

      require("indent_blankline").setup {
          space_char_blankline = " ",
          show_current_context = true,
          show_current_context_start = true,
          buftype_exclude = {"terminal"},
          filetype_exlude = {"dashboard"},
          context_patterns = {
            "class", "return", "function", "method", "^if", "^while", "jsx_element", "^for", "^object",
            "^table", "block", "arguments", "if_statement", "else_clause", "jsx_element",
            "jsx_self_closing_element", "try_statement", "catch_clause", "import_statement",
            "operation_type"
          }
      }
      end
    },
    {
      "folke/todo-comments.nvim",
      requires = "nvim-lua/plenary.nvim",
      config = function()
        require("todo-comments").setup ()
      end
    },
    {"styled-components/vim-styled-components"},
    {"mg979/vim-visual-multi"},
    {
      "folke/trouble.nvim",
      cmd = "TroubleToggle",
    },

}

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }
