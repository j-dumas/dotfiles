vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

local fzf = require("fzf-lua")
fzf.setup({})

local opts = function(desc)
    return { desc = "FZF: " .. desc }
end

local map = vim.keymap.set
map("n", "<leader>ff", fzf.files, opts("Find files"))
map("n", "<leader>fa", function()
    fzf.files({ cwd = "~" })
end, opts("Find all files"))
map("n", "<leader>fo", fzf.oldfiles, opts("Find recent files"))
map("n", "<leader>fw", fzf.live_grep, opts("Live grep"))
map("n", "<leader>fk", fzf.keymaps, opts("Search keymaps"))
