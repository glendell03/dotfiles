-- custom.plugins.lspconfig
local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers =
  { "html", "cssls", "clangd", "tsserver", "tailwindcss", "cssmodules_ls", "eslint", "graphql", "jsonls", "prismals" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tailwindcss.setup{
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
