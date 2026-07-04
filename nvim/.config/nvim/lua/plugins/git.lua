vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/kdheepak/lazygit.nvim",
})

vim.keymap.set("n", "<leader>g", "<cmd>LazyGit<cr>", { desc = "Open Lazygit" })
