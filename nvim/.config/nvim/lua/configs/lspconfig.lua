require("nvchad.configs.lspconfig").defaults()
local nvlsp = require("nvchad.configs.lspconfig")

local servers = { "clangd", "ltex" }
vim.lsp.enable(servers)

vim.lsp.config.clangd = {
	cmd = { "clangd", "--enable-config" },
}

-- Still use lspconfig to setup properly ltex_extra
require("lspconfig").ltex.setup = {
	on_init = nvlsp.on_init,
	on_attach = function(client, bufnr)
		nvlsp.on_attach(client, bufnr)
		require("ltex_extra").setup({
			load_langs = { "fr", "en-CA" },
			path = vim.fn.expand("~") .. "/.local/share/ltex",
		})
	end,
	capabilities = nvlsp.capabilities,
	filetypes = { "bib", "markdown", "tex", "plaintex" },
	settings = {
		ltex = {
			language = { "en-CA" },
			additionalRules = {
				motherTongue = { "fr" },
				enablePickyRules = true,
			},
			enabled = { "bibtex", "markdown", "tex", "latex" },
		},
	},
}

-- local lspconfig = require("lspconfig")
--
-- local masonlsp = require("mason-lspconfig")
--
-- masonlsp.setup()
-- masonlsp.setup_handlers({
--
-- 	function(lsp)
-- 		lspconfig[lsp].setup({
-- 			on_init = nvlsp.on_init,
-- 			on_attach = nvlsp.on_attach,
-- 			capabilities = nvlsp.capabilities,
-- 		})
-- 	end,
--
-- 	["clangd"] = function()
-- 		lspconfig["clangd"].setup({
-- 			on_init = nvlsp.on_init,
-- 			on_attach = nvlsp.on_attach,
-- 			capabilities = nvlsp.capabilities,
-- 			cmd = { "clangd", "--enable-config" },
-- 		})
-- 	end,
--
-- 	-- ["pylsp"] = function()
-- 	-- 	lspconfig["pylsp"].setup({
-- 	-- 		on_init = nvlsp.on_init,
-- 	-- 		on_attach = nvlsp.on_attach,
-- 	-- 		capabilities = nvlsp.capabilities,
-- 	-- 		settings = {
-- 	-- 			pylsp = {
-- 	-- 				plugins = {
-- 	-- 					pycodestyle = {
-- 	-- 						ignore = { "E203" },
-- 	-- 						maxLineLength = 88, -- Black formatter
-- 	-- 					},
-- 	-- 				},
-- 	-- 			},
-- 	-- 		},
-- 	-- 	})
-- 	-- end,
--
-- })
