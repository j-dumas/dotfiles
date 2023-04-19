---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<CR>"] = { "o<ESC>", "Newline" },
  },
}

-- more keybinds!

return M
