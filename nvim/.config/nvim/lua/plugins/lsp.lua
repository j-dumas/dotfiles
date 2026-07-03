vim.pack.add({
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/Crysthamus/nvim-file-operations",
})

local map = vim.keymap.set

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local opts = function(desc)
            return { buffer = args.buf, desc = "LSP: " .. desc }
        end

        -- Navigation
        map("n", "gd", vim.lsp.buf.definition, opts("Go to Definition"))
        map("n", "gD", vim.lsp.buf.declaration, opts("Go to Declaration"))
        map("n", "gi", vim.lsp.buf.implementation, opts("Go to Implementation"))
        map("n", "gr", vim.lsp.buf.references, opts("Go to References"))

        -- Actions
        map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code Action"))

        -- Diagnostics
        map("n", "<leader>df", vim.diagnostic.open_float, opts("Show Diagnostic"))
        map("n", "<leader>dn", function()
            vim.diagnostic.jump({ count = 1, float = true })
        end, opts("Next Diagnostic"))
        map("n", "<leader>dp", function()
            vim.diagnostic.jump({ count = -1, float = true })
        end, opts("Previous Diagnostic"))
        map("n", "<leader>dl", vim.diagnostic.setloclist, opts("Diagnostics List"))
    end,
})

local lsp = vim.lsp

lsp.config("lua_ls", {
    settings = {
        Lua = { diagnostics = { globals = { "vim" } } },
    },
})

vim.lsp.config("clangd", {
    cmd = { "clangd", "--enable-config" },
})

-- pylsp comes with linter and formatter, so simpler to set here together
vim.lsp.config("pylsp", {
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = {
                    ignore = { "E203" },
                    maxLineLength = 88, -- Black formatter
                },
                black = { enabled = true },
            },
        },
    },
})

lsp.enable({ "lua_ls", "clangd", "pylsp" })

require("nvim-file-operations").setup()
vim.lsp.config("*", {
  capabilities = require("nvim-file-operations.config").default_capabilities(),
})
