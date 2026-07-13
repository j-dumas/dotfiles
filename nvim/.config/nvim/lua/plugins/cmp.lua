vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp", version = "v1" } })

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
})

vim.lsp.config("*", {
  capabilities = blink.get_lsp_capabilities(),
})
