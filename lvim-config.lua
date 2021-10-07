--[[
lvim is the global options object

Linters should be
filled in as strings with either
a global executable or a path to
an executable
]]
-- THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
-- vim.cmd("hi Normal guibg=NONE ctermbg=NONE")
-- general
local components = require "core.lualine.components"

lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "onedark"
lvim.builtin.treesitter.rainbow = {enable = true}
lvim.builtin.lualine.options.section_separators = {left = "", right = ""}
lvim.builtin.lualine.options.disabled_filetypes = {"dashboard", "Outline"}
lvim.builtin.lualine.sections = {
  lualine_a = {
      components.mode,
    },
    lualine_b = {
      components.branch,
      components.diff,
    },
    lualine_c = {
      components.python_env,
      components.filename,
    },
    lualine_x = {
      components.diagnostics,
      components.lsp,
    },
    lualine_y = {
      components.filetype,
      components.treesitter,
    },
    lualine_z = {
      components.location,
      components.scrollbar,
    },
}
lvim.builtin.lualine.inactive_sections = {
  lualine_a = {
      components.branch,
      components.diff
    },
    lualine_b = {
      components.filename,
    },
}

vim.g.blamer_enabled = 1
vim.g.blamer_show_in_insert_modes = 0

vim.g.onedark_termcolors = 256
vim.g.onedark_terminal_italics = 1
vim.g.blamer_prefix = ' ↳ '
vim.g.blamer_relative_time = 1
vim.g.blamer_delay = 500
-- vim.g.tokyonight_style = "night"
-- vim.g.tokyonight_transparent_sidebar = true
-- vim.g.tokyonight_transparent = true
-- vim.g.tokyonight_dark_sidebar = true
-- vim.g.tokyonight_italic_comments = true
-- vim.g.tokyonight_lualine_bold = true

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.lsp.diagnostics.virtual_text = false
-- unmap a default keymapping
-- lvim.keys.normal_mode["<C-Up>"] = ""
-- edit a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>"

-- Change Telescope navigation to use j and k for navigation and n and p for history in both input and normal mode.
-- lvim.builtin.telescope.on_config_done = function()
--   local actions = require "telescope.actions"
--   -- for input mode
--   lvim.builtin.telescope.defaults.mappings.i["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-k>"] = actions.move_selection_previous
--   lvim.builtin.telescope.defaults.mappings.i["<C-n>"] = actions.cycle_history_next
--   lvim.builtin.telescope.defaults.mappings.i["<C-p>"] = actions.cycle_history_prev
--   -- for normal mode
--   lvim.builtin.telescope.defaults.mappings.n["<C-j>"] = actions.move_selection_next
--   lvim.builtin.telescope.defaults.mappings.n["<C-k>"] = actions.move_selection_previous
-- end

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

lvim.builtin.which_key.mappings["d"] = {
  name = "+TODO",
  q = {"<cmd>TodoQuickFix<cr>", "TodoQuickFix"},
  l = {"<cmd>TodoLocList<cr>", "TodoLocList"},
  t = {"<cmd>TodoTrouble<cr>", "TodoTrouble"},
  e = {"<cmd>TodoTelescope<cr>", "TodoTelescope"}
}

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
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.ignore = {".git", "node_modules", ".cache"}
lvim.builtin.nvimtree.side = "left"
lvim.builtin.nvimtree.show_icons.git = 1
lvim.builtin.nvimtree.git_hl = 1
lvim.builtin.nvimtree.setup.auto_open = 1
lvim.builtin.nvimtree.setup.auto_close = 1
lvim.builtin.nvimtree.quit_on_open = 1
lvim.builtin.nvimtree.setup.tab_open = 1

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = "maintained"
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- generic LSP settings
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
-- lvim.lsp.null_ls.setup = {
--   root_dir = require("lspconfig").util.root_pattern("Makefile", ".git", "node_modules"),
-- }
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


-- set a formatter if you want to override the default lsp one (if it exists)
lvim.lang.python.formatters = {
  {
    exe = "black",
  }
}
-- set an additional linter
lvim.lang.python.linters = {
  {
    exe = "flake8",
  }
}

lvim.lang.javascript.formatters = {{exe = "prettier"}}
lvim.lang.javascriptreact.formatters = lvim.lang.javascript.formatters
lvim.lang.tsx.formatters = lvim.lang.javascript.formatters
lvim.lang.typescript.formatters = lvim.lang.javascript.formatters
lvim.lang.typescriptreact.formatters = lvim.lang.javascript.formatters

lvim.lang.javascript.linters = {{exe = "eslint"}}
lvim.lang.javascriptreact.linters = lvim.lang.javascript.linters
lvim.lang.tsx.linters = lvim.lang.javascript.linters
lvim.lang.typescript.linters = lvim.lang.javascript.linters
lvim.lang.typescriptreact.linters = lvim.lang.javascript.linters


lvim.lang.tailwindcss.active = true
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
  {'bluz71/vim-nightfly-guicolors'},
  {"folke/tokyonight.nvim"},
  {"joshdick/onedark.vim"},
  {"styled-components/vim-styled-components"},
  {"APZelos/blamer.nvim"},
  {"Pocco81/AutoSave.nvim",
    config = function()
      require("autosave").setup {
        events = {"InsertLeave"},
        write_all_buffers = true,
        clean_command_line_interval = 1,
        execution_message = "Saved"
      }
    end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "p00f/nvim-ts-rainbow",
    config = function ()
      require'nvim-treesitter.configs'.setup {
        rainbow = {
          enable = true,
          extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
          max_file_lines = nil, -- Do not enable for files with more than n lines, int
          -- colors = {}, -- table of hex strings
          -- termcolors = {} -- table of colour name strings
        }
      }
    end
  },
  {"mg979/vim-visual-multi"},
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function ()
    vim.opt.termguicolors = true
    vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 blend=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B blend=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 blend=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent4 guifg=#00A19d blend=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF blend=nocombine]]
    vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD blend=nocombine]]

    vim.opt.listchars = {
        space = "⋅",
        eol = "↴",
    }

    require("indent_blankline").setup {
        space_char_blankline = " ",
        char_highlight_list = {
            "IndentBlanklineIndent1",
            "IndentBlanklineIndent2",
            "IndentBlanklineIndent3",
            "IndentBlanklineIndent4",
            "IndentBlanklineIndent5",
            "IndentBlanklineIndent6",
        },
    } end },
  {
    "norcalli/nvim-colorizer.lua",
    config = function ()
      require "colorizer".setup {
        "*";
        css = {css = true},
        javascript = {css = true}
      }
    end
  },
  {
    "sindrets/diffview.nvim",
    config = function ()
      local cb = require"diffview.config".diffview_callback

      require'diffview'.setup {
  diff_binaries = false,    -- Show diffs for binaries
  use_icons = true,         -- Requires nvim-web-devicons
  enhanced_diff_hl = false, -- See ':h diffview-config-enhanced_diff_hl'
  signs = {
    fold_closed = "",
    fold_open = "",
  },
  file_panel = {
    position = "left",      -- One of 'left', 'right', 'top', 'bottom'
    width = 35,             -- Only applies when position is 'left' or 'right'
    height = 10,            -- Only applies when position is 'top' or 'bottom'
  },
  file_history_panel = {
    position = "bottom",
    width = 35,
    height = 16,
    log_options = {
      max_count = 256,      -- Limit the number of commits
      follow = false,       -- Follow renames (only for single file)
      all = false,          -- Include all refs under 'refs/' including HEAD
      merges = false,       -- List only merge commits
      no_merges = false,    -- List no merge commits
      reverse = false,      -- List commits in reverse order
    },
  },
  key_bindings = {
    disable_defaults = false,                   -- Disable the default key bindings
    -- The `view` bindings are active in the diff buffers, only when the current
    -- tabpage is a Diffview.
    view = {
      ["<tab>"]      = cb("select_next_entry"),  -- Open the diff for the next file
      ["<s-tab>"]    = cb("select_prev_entry"),  -- Open the diff for the previous file
      ["gf"]         = cb("goto_file"),          -- Open the file in a new split in previous tabpage
      ["<C-w><C-f>"] = cb("goto_file_split"),    -- Open the file in a new split
      ["<C-w>gf"]    = cb("goto_file_tab"),      -- Open the file in a new tabpage
      ["<leader>e"]  = cb("focus_files"),        -- Bring focus to the files panel
      ["<leader>b"]  = cb("toggle_files"),       -- Toggle the files panel.
    },
    file_panel = {
      ["j"]             = cb("next_entry"),         -- Bring the cursor to the next file entry
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),         -- Bring the cursor to the previous file entry.
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),       -- Open the diff for the selected entry.
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["-"]             = cb("toggle_stage_entry"), -- Stage / unstage the selected entry.
      ["S"]             = cb("stage_all"),          -- Stage all entries.
      ["U"]             = cb("unstage_all"),        -- Unstage all entries.
      ["X"]             = cb("restore_entry"),      -- Restore entry to the state on the left side.
      ["R"]             = cb("refresh_files"),      -- Update stats and entries in the file list.
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    file_history_panel = {
      ["g!"]            = cb("options"),            -- Open the option panel
      ["<C-d>"]         = cb("open_in_diffview"),   -- Open the entry under the cursor in a diffview
      ["zR"]            = cb("open_all_folds"),
      ["zM"]            = cb("close_all_folds"),
      ["j"]             = cb("next_entry"),
      ["<down>"]        = cb("next_entry"),
      ["k"]             = cb("prev_entry"),
      ["<up>"]          = cb("prev_entry"),
      ["<cr>"]          = cb("select_entry"),
      ["o"]             = cb("select_entry"),
      ["<2-LeftMouse>"] = cb("select_entry"),
      ["<tab>"]         = cb("select_next_entry"),
      ["<s-tab>"]       = cb("select_prev_entry"),
      ["gf"]            = cb("goto_file"),
      ["<C-w><C-f>"]    = cb("goto_file_split"),
      ["<C-w>gf"]       = cb("goto_file_tab"),
      ["<leader>e"]     = cb("focus_files"),
      ["<leader>b"]     = cb("toggle_files"),
    },
    option_panel = {
      ["<tab>"] = cb("select"),
      ["q"]     = cb("close"),
    },
  },
}
    end
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    requires = "nvim-lua/plenary.nvim",
    config = function ()
      require("todo-comments").setup {
        signs = true, -- show icons in the signs column
        sign_priority = 8, -- sign priority
  -- keywords recognized as todo comments
        keywords = {
          FIX = {
            icon = " ", -- icon used for the sign, and in search results
            color = "error", -- can be a hex color, or a named color (see below)
            alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
      -- signs = false, -- configure signs for some keywords individually
          },
          TODO = { icon = " ", color = "info" },
          HACK = { icon = " ", color = "warning" },
          WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
          PERF = { icon = " ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
          NOTE = { icon = " ", color = "hint", alt = { "INFO" } },
        },
        merge_keywords = true, -- when true, custom keywords will be merged with the defaults
  -- highlighting of the line containing the todo comment
  -- * before: highlights before the keyword (typically comment characters)
  -- * keyword: highlights of the keyword
  -- * after: highlights after the keyword (todo text)
        highlight = {
          before = "", -- "fg" or "bg" or empty
          keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
          after = "fg", -- "fg" or "bg" or empty
          pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
          comments_only = true, -- uses treesitter to match keywords in comments only
          max_line_len = 400, -- ignore lines longer than this
          exclude = {}, -- list of file types to exclude highlighting
        },
  -- list of named colors where we try to extract the guifg from the
  -- list of hilight groups or use the hex color if hl not found as a fallback
        colors = {
          error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
          warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
          info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
          hint = { "LspDiagnosticsDefaultHint", "#10B981" },
          default = { "Identifier", "#7C3AED" },
        },
        search = {
          command = "rg",
          args = {
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
        },
    -- regex that will be used to match keywords.
    -- don't replace the (KEYWORDS) placeholder
        pattern = [[\b(KEYWORDS):]], -- ripgrep regex
    -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
      },
    }
    end
  },
}


-- Autocommands (https://neovim.io/doc/user/autocmd.html)
-- lvim.autocommands.custom_groups = {
--   { "BufWinEnter", "*.lua", "setlocal ts=8 sw=8" },
-- }


