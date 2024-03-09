local function get_formatter_for_project()
  local current_dir = vim.fn.getcwd()

  if vim.fn.filereadable(current_dir .. "/.prettierrc.json") == 1 then
    return "prettierd"
  elseif vim.fn.filereadable(current_dir .. "/biome.json") == 1 then
    return "biome"
  elseif vim.fn.filereadable(current_dir .. "/deno.jsonc") == 1 then
    return "deno_fmt"
  else
    -- Default to a fallback formatter or an empty table if no formatter is preferred
    return
  end
end

local function setup_formatter()
  local formatter = get_formatter_for_project()

  local options = {
    formatters_by_ft = {
      lua = { "stylua" },
      vue = { formatter },
      javascript = { formatter },
      javascriptreact = { formatter },
      typescript = { formatter },
      typescriptreact = { formatter },
      css = { "prettierd" },
      html = { formatter },
      json = { formatter },
      jsonc = { formatter },
      markdown = { "deno_fmt" },
      prisma = { "prismaFmt" },
      rust = { "rustfmt" },
    },
    format_on_save = {
      -- These options will be passed to conform.format()
      timeout_ms = 500,
      lsp_fallback = true,
      async = true,
    },
  }

  require("conform").setup(options)
end

setup_formatter()
