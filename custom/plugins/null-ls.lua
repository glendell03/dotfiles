local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {
  -- lua
  b.formatting.stylua,

  b.formatting.prettier,

  b.formatting.prismaFmt,

  b.diagnostics.eslint,

}

null_ls.setup {
  debug = true,
  sources = sources,
}
