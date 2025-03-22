local function get_formatter_for_project()
  local current_dir = vim.fn.getcwd()

  if vim.fn.filereadable(current_dir .. "/.prettierrc.json") == 1 then
    return "prettierd"
  elseif vim.fn.filereadable(current_dir .. "/biome.json") == 1 then
    return "biome"
  elseif vim.fn.filereadable(current_dir .. "/deno.json") == 1 then
    return "deno_fmt"
  else
    -- Default to a fallback formatter or an empty table if no formatter is preferred
    return "prettierd"
  end
end

local formatter = get_formatter_for_project()

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    typescript = {
      formatter,
      stop_after_first = true,
    },
    typescriptreact = {
      formatter,
      stop_after_first = true,
    },
    tsx = {
      formatter,
      stop_after_first = true,
    },
    prisma = { "prismaFmt" },
    json = { "deno_fmt" },
    yaml = { "yamlfmt" },
    go = { "gofumpt", "goimports-reviser", lsp_format = "fallback" },
    -- css = { "prettier" },
    -- html = { "prettier" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options
