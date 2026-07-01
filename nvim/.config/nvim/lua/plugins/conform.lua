vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
    formatters = {
        stylua = {
            prepend_args = { "--indent-type", "Spaces" },
        },
    },
})

vim.keymap.set("n", "<leader>fm", function()
    require("conform").format()
end, { desc = "Format file" })
