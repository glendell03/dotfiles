return {
  -- Override plugin definition options
  ["goolord/alpha-nvim"] = {
    disable = false,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["JoosepAlviste/nvim-ts-context-commentstring"] = {
    after = "nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup {
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
        },
      }
    end,
  },

  ["numToStr/Comment.nvim"] = {
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["nvim-telescope/telescope-fzf-native.nvim"] = {
    run = "make",
  },

  -- ["williamboman/nvim-lsp-installer"] = {
  --   config = function()
  --     require("nvim-lsp-installer").setup {
  --       automatic_installation = true,
  --     }
  --   end,
  -- },

  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },

  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  },

  ["mg979/vim-visual-multi"] = {},

  ["romgrk/nvim-treesitter-context"] = {
    config = function()
      require("treesitter-context").setup {
        enable = true,
        throttle = true,

        max_lines = 0,
      }
    end,
  },

  ["karb94/neoscroll.nvim"] = {
    require("neoscroll").setup(),
  },

  ["folke/todo-comments.nvim"] = {
    requires = "nvim-lua/plenary.nvim",

    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },

  ["windwp/nvim-ts-autotag"] = {
    config = function()
      require("nvim-treesitter.configs").setup {
        autotag = {
          enable = true,
        },
      }
    end,
  },

  ["f-person/git-blame.nvim"] = {},

  -- ["sindrets/diffview.nvim"] = {
  --   requires = "nvim-lua/plenary.nvim",
  -- },

  ["wfxr/minimap.vim"] = {},
}
