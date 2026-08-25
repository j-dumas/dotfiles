vim.pack.add({
    "https://github.com/folke/which-key.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/MunifTanjim/nui.nvim", -- hardtime dep
    "https://github.com/m4xshen/hardtime.nvim",
})

require("which-key").setup({ preset = "helix" })
require("nvim-autopairs").setup({})
require("hardtime").setup({
    disable_mouse = false,
})
