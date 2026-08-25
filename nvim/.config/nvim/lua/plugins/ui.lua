vim.pack.add({
    {
        src = "https://github.com/catppuccin/nvim",
        name = "catppuccin",
    },
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/akinsho/bufferline.nvim",
    "https://github.com/rcarriga/nvim-notify",
})

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    custom_highlights = function(colors)
        return {
            MatchParen = { fg = colors.none },
            IncSearch = { bg = colors.green },
            NormalFloat = { bg = colors.none },
            FloatBorder = { bg = colors.none },
        }
    end,
    integrations = {
        lualine = {
            mocha = function(colors)
                return {
                    normal = {
                        a = { bg = "#8bc2f0" },
                        b = { fg = colors.text },
                        c = { fg = colors.surface2 },
                    },
                    insert = {
                        b = { fg = colors.text },
                    },
                    visual = {
                        b = { fg = colors.text },
                    },
                    command = {
                        b = { fg = colors.text },
                    },
                }
            end,
        },
    },
})
vim.cmd.colorscheme("catppuccin-nvim")

require("lualine").setup({
    options = {
        component_separators = { left = "", right = "" },
        section_separators = { left = "◤", right = "" },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { { "filename", path = 1 } },
        lualine_c = { "branch", "diff" },
        lualine_x = { "diagnostics", "lsp_status" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
    },
    extensions = { "nvim-tree" },
})

vim.opt.termguicolors = true
require("bufferline").setup({
    options = {
        mode = "tabs",
        diagnostics = "nvim_lsp",
        offsets = {
            {
                filetype = "NvimTree",
                text = function()
                    return vim.fn.getcwd()
                end,
                highlight = "Directory",
                text_align = "left",
            },
        },
        name_formatter = function(buf)
            return tostring(vim.api.nvim_tabpage_get_number(buf.tabnr)) .. ": " .. buf.name
        end,
    },
})

local map = vim.keymap.set
map("n", "<leader>tn", "<cmd>tabnew<CR>")
map("n", "<leader>tc", "<cmd>tabclose<CR>")
map("n", "<leader>to", "<cmd>tabonly<CR>")
map("n", "<Tab>", "<cmd>tabnext<CR>")
map("n", "<S-Tab>", "<cmd>tabprevious<CR>")

local notify = require("notify")
notify.setup({
    background_colour = "#1e1e2e",
    max_width = function()
        return math.floor(vim.o.columns * 0.4)
    end,
    render = "wrapped-compact",
    stages = "fade_in_slide_out",
})
vim.notify = notify
