local overrides = require("configs.overrides")

local nvchad = {
	-- override plugin configs
	{
		"williamboman/mason.nvim",
		opts = overrides.mason,
	},

	{
		"nvim-telescope/telescope.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		cmd = "Telescope",
		opts = function()
			local config = require("nvchad.configs.telescope")
			config.pickers = { find_files = { hidden = true } }
			return config
		end,
	},

	-- 0.11 introduced vim.lsp.config
	-- {
	--   "williamboman/mason-lspconfig.nvim",
	--   config = function()
	--     require "configs.lspconfig"
	--   end, -- Override to setup mason-lspconfig
	--   dependencies = {
	--     "williamboman/mason.nvim",
	--   },
	-- },

	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	"mfussenegger/nvim-lint",
	"rshkarin/mason-nvim-lint",

	{
		"nvim-treesitter/nvim-treesitter",
		opts = overrides.treesitter,
	},

	{
		"nvim-tree/nvim-tree.lua",
		opts = overrides.nvimtree,
	},

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"micangl/cmp-vimtex",
		},
		opts = function()
			local config = require("nvchad.configs.cmp")
			table.insert(config.sources, {
				name = "vimtex",
			})
			return config
		end,
	},

	{
		"max397574/better-escape.nvim",
		event = "InsertEnter",
		config = function()
			require("better_escape").setup()
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
		enabled = function()
			if jit then
				return jit.os == "Linux"
			else
				return false
			end
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- Latex
	{
		"lervag/vimtex",
		lazy = false, -- we don't want to lazy load VimTeX
		ft = "tex",
		init = function()
			if jit then
				if jit.os == "Linux" then
					vim.g.vimtex_view_method = "zathura"
				elseif jit.os == "Windows" then
					vim.g.vimtex_view_general_viewer = 'SumatraPDF'
					vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
				end
			end
		end,
	},

	{ "micangl/cmp-vimtex", ft = "tex" },

	{
		"barreiroleo/ltex_extra.nvim",
		ft = { "markdown", "tex" },
		dependencies = { "neovim/nvim-lspconfig" },
	},
}

return nvchad
