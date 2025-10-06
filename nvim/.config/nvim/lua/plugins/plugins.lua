local overrides = require "configs.overrides"

local nvchad = {
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = { "nvim-treesitter/nvim-treesitter" },
  --   cmd = "Telescope",
  --   opts = function()
  --     local config = require "nvchad.configs.telescope"
  --     config.pickers = { find_files = { hidden = true } }
  --     return config
  --   end,
  -- },

  -- 0.11 introduced vim.lsp.config making mason-lspconfig automatically enable lsp only
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      "mason-org/mason.nvim",
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
    },
  },

  -- TODO : add event to load?
  "mfussenegger/nvim-lint",
  "rshkarin/mason-nvim-lint",

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "VeryLazy",
    opts = { enable = true, max_lines = 2 },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "micangl/cmp-vimtex",
    },
    opts = function()
      local config = require "nvchad.configs.cmp"
      table.insert(config.sources, {
        name = "vimtex",
      })
      config.completion.keyword_length = 2
      return config
    end,
  },

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
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  -- Latex
  {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    ft = "tex",
    init = function()
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
        out_dir = "pdfs"
      }
    end,
  },

  { "micangl/cmp-vimtex", ft = "tex" },

  {
    "barreiroleo/ltex_extra.nvim",
    ft = { "markdown", "tex" },
    dependencies = { "neovim/nvim-lspconfig" },
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
}

return nvchad
