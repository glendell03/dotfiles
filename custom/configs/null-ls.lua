local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.diagnostics.deno_lint,
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  -- b.formatting.prettier,
  b.code_actions.eslint,
  b.diagnostics.eslint,
  -- b.formatting.rustfmt,
  -- b.formatting.prismaFmt,

  -- python
  b.diagnostics.flake8,
  -- b.formatting.isort,
  -- b.formatting.black,

  -- Lua
  -- b.formatting.stylua,

  -- cpp
  -- b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
  -- on_attach = function()
  --   vim.api.nvim_create_autocmd("BufWritePost", {
  --     callback = function()
  --       vim.lsp.buf.format()
  --     end,
  --   })
  -- end,
}
