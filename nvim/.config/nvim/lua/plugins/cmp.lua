vim.pack.add({
    { src = "https://github.com/Saghen/blink.cmp", version = "v1" },
    "https://github.com/Saghen/blink.compat",
    "https://github.com/micangl/cmp-vimtex",
})

require("blink.compat").setup()

local blink = require("blink.cmp")
blink.setup({
    keymap = {
        preset = "enter",

        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

        ["<Up>"] = false,
        ["<Down>"] = false,
        ["<C-p>"] = false,
        ["<C-n>"] = false,
    },
    completion = {
        list = {
            selection = { preselect = false, auto_insert = true },
        },
    },
    sources = {
        default = { "lsp", "path", "snippets", "buffer", "vimtex" },
        providers = {
            vimtex = {
                name = "vimtex",
                module = "blink.compat.source",
                score_offset = 80,
                min_keyword_length = 2,
            },
        },
    },
})

vim.lsp.config("*", {
    capabilities = blink.get_lsp_capabilities(),
})
