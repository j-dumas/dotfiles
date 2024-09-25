--@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.ui = {
  theme = "chadracula",

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,

    header = {
      "██   ██ ███████ ██      ██       █████          ",
      "██   ██ ██      ██      ██      ██   ██         ",
      "███████ █████   ██      ██      ██   ██         ",
      "██   ██ ██      ██      ██      ██   ██         ",
      "██   ██ ███████ ███████ ███████  █████          ",
      "                                                ",
      "██        ██  █████  ██████  ██      ██████  ██ ",
      "██   ██   ██ ██   ██ ██   ██ ██      ██   ██ ██ ",
      " ██ ████ ██  ██   ██ ██████  ██      ██   ██ ██ ",
      " ████  ████  ██   ██ ██   ██ ██      ██   ██    ",
      "  ██    ██    █████  ██   ██ ███████ ██████  ██ ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
  },

  tabufline = {
    enabled = false,
  },

  statusline = {
    overriden_modules = function(modules)
      if vim.bo[0].modified and "%" then
        modules[2] = (function()
          return modules[2] .. "%#StText# " .. " [+] "
        end)()
      end
    end,
    order = { "mode", "file", "modified", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      modified = function()
        if vim.bo[0].modified and "%" then
          return "%#StText# " .. " [+] "
        end
        return ""
      end,
    },
  },

  mason = {
    cmd = true,
    pkgs = {
      -- lua stuff
      "lua-language-server",
      "stylua",

      -- web dev stuff
      "css-lsp",
      "html-lsp",
      "json-lsp",
      "prettier",

      -- c/cpp stuff
      "clangd",
      "clang-format",
    },
  },
}

return M
