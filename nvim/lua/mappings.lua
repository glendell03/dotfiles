require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "<S-Up>", ":m-2<CR>")
map("n", "<S-Down>", ":m+<CR>")

map("n", "<leader>lf", function()
  vim.diagnostic.open_float(nil, {
    focus = true,
    scope = "cursor",

    border = false,
    -- show_header = false,
    -- header = "",
    source = true,
  })
end)

map("n", "<leader>td", ":TodoTelescope<CR>")
map("n", "<leader>tD", ":TodoTelescope keywords=TODO<CR>")
map("n", "<leader>tF", ":TodoTelescope keywords=FIX,FIXME,BUG,FIXIT,ISSUE<CR>")
map("n", "<leader>tW", ":TodoTelescope keywords=WARN,WARNING<CR>")
map("n", "<leader>tN", ":TodoTelescope keywords=NOTE<CR>")

map("n", "<C-t>", ":tabnew<CR>")
map("n", "<C-tn>", ":tabnext<CR>")
map("n", "<S-t>", ":tabclose<CR>")

-- Navigation
map("n", "]c", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
map("n", "[c", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

-- Actions
map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>")
map("v", "<leader>gs", ":Gitsigns stage_hunk<CR>")
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>")
map("v", "<leader>gr", ":Gitsigns reset_hunk<CR>")
map("n", "<leader>gS", "<cmd>Gitsigns stage_buffer<CR>")
map("n", "<leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<CR>")
map("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
map("n", "<leader>gb", '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<CR>")
map("n", "<leader>gD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
map("n", "<leader>gtd", "<cmd>Gitsigns toggle_deleted<CR>")
