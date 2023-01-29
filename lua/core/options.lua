local opt = vim.opt

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"

opt.clipboard:append("unnamedplus")

-- split window
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- auto
opt.autowrite = true
opt.autoread = true
