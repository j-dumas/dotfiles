local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    c = { "clang_format" },
    tex = { "Latexindent" },
  },

  formatters = {
    prettier = {
      args = { "--no-semi", "--single-quote", "--jsx-single-quote" },
    },
    black = {

    }
  },

  default_format_opts = {
    lsp_format = "fallback",
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

require("conform").setup(options)
