-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  -- "html",
  -- "cssls",
  "gopls",
  -- "denols",
  "prismals",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- lspconfig.denols.setup {
--   on_attach = nvlsp.on_attach,
--   root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
-- }

require("typescript-tools").setup {
  on_attach = nvlsp.on_attach,
  single_file_support = false,
}
