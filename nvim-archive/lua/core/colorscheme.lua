local status, _ = pcall(vim.cmd, "colorscheme dracula")
if not status then
    print("Colorscheme not found")
    return
end

require("nvim-web-devicons").setup {
    color_icons = true,
    default = true,
}

require('colorizer').setup()
