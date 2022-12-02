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
lvim.colorscheme = "catppuccin"
vim.g.catppuccin_flavour = "macchiato"
lvim.transparent_window = true
-- lvim.lsp.diagnostics.virtual_text = false
lvim.builtin.lualine.options.disabled_filetypes = { "NvimTree", "minimap", 'alpha' }
vim.wo.relativenumber = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- minimap
vim.g.minimap_auto_start = 0
vim.g.minimap_highlight_search = 1
vim.g.minimap_git_colors = 1
vim.g.minimap_close_filetypes = { "alpha" }
vim.g.minimap_block_filetypes = { "NvimTree" }

--git blame
vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = '    <author> • <date> • <summary>    '
vim.g.gitblame_date_format = "%a %x"
vim.g.gitblame_ignored_filetypes = { "NvimTree" }
-- vim.g.gitblame_display_virtual_text = 0
-- local git_blame = require('gitblame')
-- local components = require("lvim.core.lualine.components")

-- lvim.builtin.lualine.sections.lualine_c = { components.diff, components.python_env,
-- { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available } }
-- lvim.builtin.lualine.sections.lualine_b = { components.filename }

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-x>"] = ":MinimapToggle<cr>"
lvim.keys.normal_mode["<C-g>"] = ":GitBlameToggle<cr>"
lvim.keys.normal_mode["<Tab>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-Up>"] = ":m-2<CR>"
lvim.keys.normal_mode["<S-Down>"] = ":m+<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )

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
  d = { "<cmd>Trouble document_diagnostics<cr>", "Diagnostics" },
  q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
  l = { "<cmd>Trouble loclist<cr>", "LocationList" },
  w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
  t = { "<cmd>TodoTrouble<cr>", "Todo Trouble" }
}

lvim.builtin.which_key.mappings["v"] = {
  name = "+Diffview",
  o = { "<cmd>DiffviewOpen<cr>", "Open" },
  c = { "<cmd>DiffviewClose<cr>", "Close" },
  t = { "<cmd>DiffviewToggleFiles<cr>", "Toggle Files" },
  f = { "<cmd>DiffviewFocusFiles<cr>", "Focus Files" },
  r = { "<cmd>DiffviewRefresh<cr>", "Refresh" }
}

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings

-- -- make sure server will always be installed even if the server is in skipped_servers list
-- lvim.lsp.installer.setup.ensure_installed = {
--     "sumeko_lua",
--     "jsonls",
-- }
-- -- change UI setting of `LspInstallInfo`
-- -- see <https://github.com/williamboman/nvim-lsp-installer#default-configuration>
-- lvim.lsp.installer.setup.ui.check_outdated_servers_on_open = false
-- lvim.lsp.installer.setup.ui.border = "rounded"
-- lvim.lsp.installer.setup.ui.keymaps = {
--     uninstall_server = "d",
--     toggle_server_expand = "o",
-- }

-- ---@usage disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. !!Requires `:LvimCacheReset` to take effect!!
-- ---see the full default list `:lua print(vim.inspect(lvim.lsp.automatic_configuration.skipped_servers))`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. !!Requires `:LvimCacheReset` to take effect!!
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- vim.tbl_map(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "black", filetypes = { "python" } },
  --   { command = "isort", filetypes = { "python" } },
  {
    --     -- each formatter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
    command = "prettierd",
    --     ---@usage arguments to pass to the formatter
    --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
    --     extra_args = { "--print-with", "100" },
    --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "tsx", "jsx" },
  },
}

-- -- set additional linters
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "flake8", filetypes = { "python" } },
  {
    command = "eslint_d",
    filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "tsx", "jsx" },
  }
  --   {
  --     -- each linter accepts a list of options identical to https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#Configuration
  --     command = "shellcheck",
  --     ---@usage arguments to pass to the formatter
  --     -- these cannot contain whitespaces, options such as `--line-width 80` become either `{'--line-width', '80'}` or `{'--line-width=80'}`
  --     extra_args = { "--severity", "warning" },
  --   },
  --   {
  --     command = "codespell",
  --     ---@usage specify which filetypes to enable. By default a providers will attach to all the filetypes it supports.
  --     filetypes = { "javascript", "python" },
  --   },
}
local macchiato = require("catppuccin.palettes").get_palette "macchiato"
local ucolors = require "catppuccin.utils.colors"

-- Additional Plugins
lvim.plugins = {
  { "catppuccin/nvim", as = "catppuccin",
    require("catppuccin").setup({
      transparent_background = true,
      color_overrides = {
        all = {
          lavender = macchiato.flamingo,
        }
      },
      highlight_overrides = {
        all = {
          VertSplit = { fg = macchiato.base },
          CursorLine = { bg = macchiato.mantle },
          DiagnosticVirtualTextError = { bg = ucolors.darken(macchiato.red, 0.3) },
          DiagnosticVirtualTextWarn = { bg = ucolors.darken(macchiato.yellow, 0.3) },
          DiagnosticVirtualTextInfo = { bg = ucolors.darken(macchiato.blue, 0.3) },
          DiagnosticVirtualTextHint = { bg = ucolors.darken(macchiato.teal, 0.3) }
        }
      },

      integrations = {
        indent_blankline = {
          enabled = true,
          colored_indent_levels = false
        }
      }
    })
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  { 'wfxr/minimap.vim' },
  { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' },
  { "f-person/git-blame.nvim" },
  {
    "windwp/nvim-ts-autotag",
    require("nvim-ts-autotag").setup()

  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "css", "scss", "html", "javascript", "javascriptreact", "typescript",
        "typescriptreact", "tsx", "jsx" },
        {

          RGB = true, -- #RGB hex codes
          RRGGBB = true, -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true, -- CSS rgb() and rgba() functions

          hsl_fn = true, -- CSS hsl() and hsla() functions
          css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
    end,
  },
  -- {

  --   "lukas-reineke/indent-blankline.nvim",
  --   event = "BufRead",
  --   config = function()

  --     vim.opt.list = true
  --     -- vim.opt.listchars:append "space:⋅"
  --     -- vim.opt.listchars:append "eol:↴"
  --     local opts = {
  --       --     -- char = "▏",
  --       filetype_exclude = {
  --         "alpha",
  --         "help",
  --         "terminal",
  --         "dashboard",
  --         "lspinfo",
  --         "lsp-installer",
  --         "mason",
  --       },
  --       buftype_exclude = { "terminal" },
  --       bufname_exclude = { "config.lua" },

  --       show_trailing_blankline_indent = false,
  --       show_first_indent_level = false,
  --       space_char_blankline = " ",
  --       show_current_context = true,
  --       show_current_context_start = true,
  --     }

  --     require("indent_blankline").setup(opts)
  --   end
  -- },
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",

    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  { 'karb94/neoscroll.nvim',
    require('neoscroll').setup()
  },
  { "romgrk/nvim-treesitter-context",
    config = function()
      require("treesitter-context").setup {
        enable = true,
        throttle = true,
        max_lines = 0,
      }
    end
  },
  { 'mg979/vim-visual-multi' }

}

if vim.fn.has "wsl" == 1 then
  vim.g.clipboard = {
    copy = {
      ["+"] = "win32yank.exe -i --crlf",
      ["*"] = "win32yank.exe -i --crlf",
    },
    paste = {
      ["+"] = "win32yank.exe -o --lf",
      ["*"] = "win32yank.exe -o --lf",
    },
  }
end

-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- vim.api.nvim_create_autocmd("BufEnter", {
--   pattern = { "*.json", "*.jsonc" },
--   -- enable wrap mode for json files only
--   command = "setlocal wrap",
-- })
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
vim.api.nvim_create_autocmd('BufRead', {
  pattern = { "/home/glendell03/betterteem/betterteem-web/**.js" },
  command = "set shiftwidth=4"
})
