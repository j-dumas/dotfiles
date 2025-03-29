local lspconfig = require "lspconfig"
local nvlsp = require "nvchad.configs.lspconfig"

local masonlsp = require "mason-lspconfig"

masonlsp.setup()
masonlsp.setup_handlers {

  function(lsp)
    lspconfig[lsp].setup {
      on_init = nvlsp.on_init,
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
    }
  end,

  ["clangd"] = function()
    lspconfig["clangd"].setup {
      on_init = nvlsp.on_init,
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
      cmd = { "clangd", "--enable-config" },
    }
  end,

  ["pylsp"] = function()
    lspconfig["pylsp"].setup {
      on_init = nvlsp.on_init,
      on_attach = nvlsp.on_attach,
      capabilities = nvlsp.capabilities,
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
  end,

  ["ltex"] = function()
    lspconfig["ltex"].setup {
      on_init = nvlsp.on_init,
      on_attach = function(client, bufnr)
        nvlsp.on_attach(client, bufnr)
        require("ltex_extra").setup {
          load_langs = { "fr", "en-CA" },
          path = vim.fn.expand "~" .. "/.local/share/ltex",
        }
      end,
      capabilities = nvlsp.capabilities,
      settings = {
        ltex = {
          language = { "en-CA" },
          additionalRules = {
            motherTongue = { "fr" },
            enablePickyRules = true,
          },
        },
      },
    }
  end,
}
