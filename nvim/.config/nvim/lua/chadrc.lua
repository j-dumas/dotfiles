--@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "highlights"

M.base46 = {
  theme = "catppuccin",

  hl_override = highlights.override,
  hl_add = highlights.add,
  transparency = true,
}

M.nvdash = {
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
    "                                                ",
    "                                                ",
  },

  buttons = {
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "  Find File From Home", keys = "Spc f s", cmd = "Telescope find_files cwd=~" },
    { txt = "󰈭  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
    { txt = "󰌌  Mappings", keys = "Spc c h", cmd = "NvCheatsheet" },
  },
}

M.ui = {
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
}

M.mason = {
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
}

M.term = {
  float = {
    relative = "editor",
    row = 0.1,
    col = 0.15,
    width = 0.7,
    height = 0.7,
    border = "double",
  },
}

return M
