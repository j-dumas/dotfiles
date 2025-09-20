require("nvchad.mappings")

local map = vim.keymap.set
-- local unmap = vim.keymap.del

-- Newline from normal mode
map("n", "<CR>", "o<ESC>")

-- Tmux Navigator
if jit then
	if jit.os == "Linux" then
		map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Tmux Window Left" })
		map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Tmux Window Right" })
		map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Tmux Window Down" })
		map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Tmux Window Up" })
	end
end

-- Find from home
map(
	"n",
	"<leader>fs",
	"<cmd> Telescope find_files cwd=~ hidden=true follow=true no_ignore=true<CR>",
	{ desc = "telescope find files starting from home" }
)

-- LazyGit
map({ "n", "t" }, "<A-g>", function()
	require("nvchad.term").toggle({ pos = "float", id = "LazyGit", cmd = "lazygit" })
end, { desc = "Opening LazyGit in floating terminal" })

-- Visual lines
map({ "n", "v" }, "k", function()
	return vim.v.count == 0 and "gk" or "k"
end, { desc = "Moving up visual lines", noremap = true, expr = true })

map({ "n", "v" }, "j", function()
	return vim.v.count == 0 and "gj" or "j"
end, { desc = "Moving down visual lines", noremap = true, expr = true })

-- Added back code actions
map("n", "<leader>ca", function ()
  vim.lsp.buf.code_action()
end, {desc = "LSP Code actions"})

