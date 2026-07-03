vim.pack.add({
    "https://github.com/folke/which-key.nvim",
    "https://github.com/windwp/nvim-autopairs",
})

require("which-key").setup({ preset = "helix" })
require("nvim-autopairs").setup({})
