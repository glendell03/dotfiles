return {
  ["goolord/alpha-nvim"] = {
    disable = false,
  },
  ["folke/which-key.nvim"] = { disable = false },
  ["windwp/nvim-ts-autotag"] = {
    event = "InsertEnter",
    config = function()
      require("nvim-ts-autotag").setup {
        filetypes = {
          "html",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "svelte",
          "vue",
          "tsx",
          "jsx",
          "rescript",
        },
      }
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
    ensure_installed = {
      -- lua stuff
      "lua-language-server",
      "stylua",
    },
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-lspconfig",
    config = function()
      require "custom.plugins.null-ls"
    end,
  },
  ["f-person/git-blame.nvim"] = {
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_date_format = "%x"
    end,
  },
  -- ["tpope/vim-surround"] = {},
  ["wfxr/minimap.vim"] = {
    config = function ()
      vim.g.minimap_auto_start = 1
      -- vim.g.minimap_highlight_range = 1
      vim.g.minimap_highlight_search = 1
      vim.g.minimap_git_colors = 1
    end
  }
}
