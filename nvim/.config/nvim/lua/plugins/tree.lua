vim.pack.add({
    {
        src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
        version = vim.version.range("3"),
    },
    -- Dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    {
        src = "https://github.com/s1n7ax/nvim-window-picker",
        version = vim.version.range("2.*"),
    },
})

require("window-picker").setup({
    hint = "statusline-winbar",
    selection_chars = "ABCDEFGHIJKLMNOP",
    highlights = {
        enabled = true,
        statusline = {
            unfocused = {
                fg = "#f38ba8",
                bg = "NONE",
                bold = true,
            },
        },
        winbar = {
            unfocused = {
                fg = "#f38ba8",
                bg = "NONE",
                bold = true,
            },
        },
    },
})

require("neo-tree").setup({
    window = {
        mappings = {
            ["<cr>"] = "open_with_window_picker",
            ["<2-LeftMouse>"] = "open_with_window_picker",
            ["s"] = "split_with_window_picker",
            ["v"] = "vsplit_with_window_picker",
            ["S"] = "noop",
            ["w"] = "noop",
        },
    },
})

local opts = function(desc)
            return { desc = "Neotree: " .. desc }
        end
local map = vim.keymap.set

map("n", "<leader>e", "<cmd>Neotree toggle reveal=true<cr>", opts("Focus Explorer"))
map("n", "<leader>b", "<cmd>Neotree focus source=buffers<cr>", opts("Focus Buffers"))
