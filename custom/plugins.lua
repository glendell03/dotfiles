local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
      { "pmizio/typescript-tools.nvim" },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup {
        pre_hook = function(...)
          local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
          if loaded and ts_comment then
            return ts_comment.create_pre_hook()(...)
          end
        end,
      }
    end,
  },

  -- override plugin configs
  {
    "hrsh7th/nvim-cmp",
    opts = overrides.cmp,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre",
    config = function()
      require "custom.configs.conform"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
    lazy = true,
    event = "VeryLazy",
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- To make a plugin not be loaded
  {
    "NvChad/nvim-colorizer.lua",
    -- enabled = false
    opts = {
      user_default_options = {
        tailwind = true,
        sass = { enable = true, parsers = { "css" } }, -- Enable sass colors
        always_update = true,
      },
    },
  },

  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup()
    end,
    event = "VeryLazy",
  },

  { "mg979/vim-visual-multi", event = "VeryLazy" },

  { "princejoogie/tailwind-highlight.nvim", event = "VeryLazy" },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup {
        -- context_commentstring = {
        --   enable = true,
        --   config = {
        --     javascript = {
        --       __default = "// %s",
        --       jsx_element = "{/* %s */}",
        --       jsx_fragment = "{/* %s */}",
        --       jsx_attribute = "// %s",
        --       comment = "// %s",
        --     },
        --     typescript = { __default = "// %s", __multiline = "/* %s */" },
        --   },
        -- },
      }
    end,
  },

  { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim", event = "VeryLazy" },

  { "simrat39/rust-tools.nvim", event = "VeryLazy" },

  {
    "saecki/crates.nvim",
    tag = "v0.3.0",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("crates").setup {
        null_ls = {
          enabled = true,
          name = "crates.nvim",
        },
        popup = {
          border = "rounded",
        },
      }
    end,
    event = "VeryLazy",
  },

  { "HiPhish/rainbow-delimiters.nvim", lazy = false },
  -- {
  --   "Exafunction/codeium.vim",
  --   event = "BufEnter",
  -- },
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    event = "InsertEnter",
    config = function()
      require("codeium").setup {}
    end,
  },
}

return plugins
