local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettierd,
  b.code_actions.eslint_d,
  b.diagnostics.eslint_d,
  b.diagnostics.jsonlint,
  b.diagnostics.stylelint,
  b.diagnostics.yamllint,
  b.formatting.yamlfmt,
  -- b.formatting.deno_fmt,
  -- b.diagnostics.tsc,
  b.formatting.prismaFmt,
  b.formatting.stylelint,

  --python
  b.diagnostics.flake8,
  b.formatting.black,

  -- Lua
  b.formatting.stylua,

  -- Git
  b.code_actions.gitsigns,

  b.completion.tags,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function()
    vim.api.nvim_create_autocmd("BufWritePost", {
      callback = function()
        vim.lsp.buf.format()
      end,
    })
  end,
}
