local nvlsp = require "nvchad.configs.lspconfig"
nvlsp.defaults()

vim.lsp.config.clangd = {
  cmd = { "clangd", "--enable-config" },
}

vim.lsp.config.pylsp = {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = { "E203" },
          maxLineLength = 88, -- Black formatter
        },
      },
    },
  },
}

-- Still use lspconfig to setup properly ltex_extra
require("lspconfig").ltex.setup = {
  on_init = nvlsp.on_init,
  on_attach = function(client, bufnr)
    nvlsp.on_attach(client, bufnr)
    require("ltex_extra").setup {
      load_langs = { "fr", "en-CA" },
      path = vim.fn.expand "~" .. "/.local/share/ltex",
    }
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
