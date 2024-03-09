local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = {
  "html",
  "cssls",
  -- "tsserver",
  "clangd",
  "rust_analyzer",
  "pyright",
  "prismals",
  "denols",
  "biome",
  "jsonls",
  "tailwindcss",
  -- "vuels",
  "volar",
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.denols.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}
--
-- lspconfig.tsserver.setup {
--   on_attach = on_attach,
--   root_dir = lspconfig.util.root_pattern "package.json",
--   single_file_support = false,
-- }

require("typescript-tools").setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern "package.json",
  single_file_support = false,
}

lspconfig.biome.setup {
  on_attach = on_attach,
  root_dir = lspconfig.util.root_pattern "biome.json",
  single_file_support = false,
}

-- lspconfig.pyright.setup { blabla}
local tw_highlight = require "tailwind-highlight"

lspconfig.tailwindcss.setup {
  root_dir = lspconfig.util.root_pattern("tailwind.config.ts", "tailwind.config.js"),
  -- on_attach = on_attach,
  on_attach = function(client, bufnr)
    -- rest of you config
    tw_highlight.setup(client, bufnr, {
      single_column = false,
      mode = "background",
      debounce = 200,
    })
  end,
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          "tw`([^`]*)", -- tw`...`
          "tw='([^']*)", -- <div tw="..." />
          "tw={`([^`}]*)", -- <div tw={"..."} />
          "tw\\.\\w+`([^`]*)", -- tw.xxx`...`
          "tw\\(.*?\\)`([^`]*)", -- tw(component)`...`
          "styled\\(.*?, '([^']*)'\\)",
          { "cn\\(([^)]*)\\)", "(?:'|\"|`)([^\"'`]*)(?:'|\"|`)" },
        },
      },
    },
  },
}

-- lspconfig.rust_analyzer.setup {
--   settings = {
--     ["rust-analyzer"] = {
--       checkonsave = {
--         command = "clippy",
--       },
--     },
--   },
-- }

local rt = require "rust-tools"

rt.setup {
  tools = {
    executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
    reload_workspace_from_cargo_toml = true,
    runnables = {
      use_telescope = true,
    },
    inlay_hints = {
      auto = true,
      only_current_line = false,
      show_parameter_hints = false,
      parameter_hints_prefix = "<-",
      other_hints_prefix = "=>",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "comment",
    },
    hover_actions = {
      border = "rounded",
    },
    on_initialized = function()
      vim.api.nvim_create_autocmd({ "bufwritepost", "bufenter", "cursorhold", "insertleave" }, {
        pattern = { "*.rs" },
        callback = function()
          local _, _ = pcall(vim.lsp.codelens.refresh)
        end,
      })
    end,
  },
  -- dap = {
  --   adapter = codelldb_adapter,
  -- },
  server = {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      vim.keymap.set("n", "k", rt.hover_actions.hover_actions, { buffer = bufnr })
    end,
    capabilities = capabilities,
    settings = {
      ["rust-analyzer"] = {
        cargo = {
          allfeatures = true,
        },
        lens = {
          enable = true,
        },
        checkonsave = {
          enable = true,
          command = "clippy",
        },
      },
    },
  },
}
