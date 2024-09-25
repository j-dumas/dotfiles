local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

local name = "clangd"
local cmd = { name, "--enable-config" }

lspconfig[name].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = cmd,
}
