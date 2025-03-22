local null_ls = require "null-ls"

null_ls.setup {
  sources = {
    null_ls.builtins.diagnostics.yamllint,
    null_ls.builtins.formatting.yamlfix,
    require "none-ls.code_actions.eslint_d",
    require "none-ls.diagnostics.eslint_d",
  },
}
