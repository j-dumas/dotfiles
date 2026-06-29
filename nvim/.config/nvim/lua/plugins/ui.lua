vim.pack.add { 
    { 
        src = "https://github.com/catppuccin/nvim",
        name = "catppuccin" 
    } ,
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/nvim-lualine/lualine.nvim'
}

require("catppuccin").setup({
    flavour = "mocha",
    transparent_background = true,
    custom_highlights = function(colors)
        local U = require("catppuccin.utils.colors")
        return {
            MatchParen = { fg = colors.none, style = {} },
            IncSearch = { bg = colors.green },
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
            end
        }
    }
})
vim.cmd.colorscheme "catppuccin-nvim"

require('lualine').setup({
    options = {
        component_separators = {left = '', right = ''},
        section_separators = {left = '◤', right = ''}
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {{'filename', path = 1}},
        lualine_c = {'branch', 'diff'},
        lualine_x = {'diagnostics', 'lsp_status'},
        lualine_y = {'location'},
        lualine_z = {'progress'}
    },
    extensions = {'nvim-tree'}
})
