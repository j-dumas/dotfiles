--@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

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
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
