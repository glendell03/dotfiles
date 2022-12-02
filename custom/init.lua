vim.opt.relativenumber = true

-- minimap
vim.g.minimap_auto_start = 0
vim.g.minimap_highlight_search = 1
vim.g.minimap_highlight_range = 0
vim.g.minimap_git_colors = 1
vim.g.minimap_close_filetypes = { "alpha" }
vim.g.minimap_block_filetypes = { "NvimTree" }

--git blame
vim.g.gitblame_enabled = 0
vim.g.gitblame_message_template = "    <author> • <date> • <summary>    "
vim.g.gitblame_date_format = "%a %x"
vim.g.gitblame_ignored_filetypes = { "NvimTree" }

vim.diagnostic.config {
  virtual_text = false,
  float = {
    show_header = true,
    source = "always",
    focusable = false,
    border = "rounded",
  },
}

-- vim.g.markdown_fenced_languages = {
--   "ts=typescript",
-- }
