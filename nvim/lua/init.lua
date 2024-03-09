local disabled_built_ins = {
    "gzip", "man", "matchit", "matchparen", "netrwPlugin", "tarPlugin",
    "tohtml", "tutor", "zipPlugin"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- vim.diagnostic.config {
--   -- virtual_text = false
--   float = {
--     border = "single",
--     show_header = false,
--     header = "",
--     source = true
--   }
-- }
