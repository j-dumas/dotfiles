local overrides = require "configs.overrides"

local nvchad = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vimdoc",
        "luadoc",
        "vim",
        "lua",
        "c",
        "cpp",
      },
    },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    enabled = function()
      if jit then
        return jit.os == "Linux"
      else
        return false
      end
    end,
  },
  {
    "lervag/vimtex",
    lazy = true, -- we don't want to lazy load VimTeX
    ft = "tex",
  },
}

return nvchad
