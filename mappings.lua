require "nvchad.mappings"

local map = vim.keymap.set

map("n", "<CR>", "o<ESC>", { desc = "Newline" })

-- Tmux Navigator
if jit then
  if jit.os == "Linux" then
    map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Tmux Window Left" })
    map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Tmux Window Right" })
    map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Tmux Window Down" })
    map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Tmux Window Up" })
  end
end
