--@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "nightfox",

  hl_override = highlights.override,
  hl_add = highlights.add,

  nvdash = {
    load_on_startup = true,
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
      --
      -- return {
      --   fileInfo = function()
      --     if vim.bo[0].modified and "%" then
      --       return st_modules.fileInfo():gsub("%#St_file_sep# ", "") .. " [+] " .. "%#St_file_sep#" .. " "
      --     else
      --       return st_modules.fileInfo()
      --     end
      --   end,
      -- }
    end,
  },
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
