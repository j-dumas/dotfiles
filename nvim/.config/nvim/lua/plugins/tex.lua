-- Before pack.add to properly init vimtex before loading
if jit then
    if jit.os == "Linux" then
        vim.g.vimtex_view_method = "zathura"
    elseif jit.os == "Windows" then
        vim.g.vimtex_view_general_viewer = "SumatraPDF"
        vim.g.vimtex_view_general_options = "-reuse-instance -forward-search @tex @line @pdf"
    end
end

vim.g.vimtex_compiler_latexmk = {
    aux_dir = "build",
    out_dir = "pdfs",
}

vim.g.vimtex_syntax_enabled = false

vim.pack.add({
    "https://github.com/lervag/vimtex",
    "https://github.com/barreiroleo/ltex_extra.nvim",
})

-- ltex-ls-plus was installed with mise use -g github:ltex-plus/ltex-ls-plus
vim.lsp.config("ltex_plus", {
    autostart = false,
    on_attach = function()
        require("ltex_extra").setup({
            load_langs = { "fr", "en-CA" },
            path = vim.fn.stdpath("data") .. "/ltex",
        })
    end,
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
})

vim.api.nvim_create_user_command("LtexStart", function()
  vim.lsp.enable("ltex_plus")
end, {})
