vim.pack.add({
    "https://github.com/stevearc/conform.nvim",
})

local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" }, -- Installed with mise
        c = { "clang_format" }, -- Installed with package manager
        tex = { "latexindent" }, -- Installed with tlmgr
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
    conform.format()
end, { desc = "Format file" })
