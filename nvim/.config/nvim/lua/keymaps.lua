local map = vim.keymap.set

map("n", "<Esc>", "<cmd>noh<CR>", { silent = true, desc = "Clear highlights" })

-- Moving in insert mode
map("i", "<C-b>", "<ESC>^i", { desc = "Move beginning of line" })
map("i", "<C-e>", "<End>", { desc = "Move end of line" })
map("i", "<C-h>", "<Left>", { desc = "Move left" })
map("i", "<C-l>", "<Right>", { desc = "Move right" })
map("i", "<C-j>", "<Down>", { desc = "Move down" })
map("i", "<C-k>", "<Up>", { desc = "Move up" })

-- Moving in panes
map("n", "<C-h>", "<C-w>h", { desc = "Switch pane left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch pane right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch pane down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch pane up" })

-- Comments
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
