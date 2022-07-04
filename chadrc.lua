-- remove this if you dont use custom.init.lua at all
require "custom"

local pluginOverride = require("custom.plugins.override")

local M = {}

M.options = {
  -- load your options here or load module with options1
  user = function() end,

  nvChad = {
    -- updater
    update_url = "https://github.com/NvChad/NvChad",
    update_branch = "main",
  },
}

---- UI -----

M.ui = {
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "onedark", -- default theme
  transparency = false,
}

M.plugins = {
   override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginOverride.treesitter,
    ["lewis6991/gitsigns.nvim"] = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
        ignore_whitespace = true,
      },
    },
  },
  remove = {
    "kyazdani42/nvim-tree.lua",
    "max397574/better-escape.nvim",
  },

  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.configs.lspconfig", -- path of lspconfig file
    },
    statusline = {
      separator_style = "default", -- default/round/slant/block/arrow
    },
    telescope = {
      extensions = { "themes", "terms" }
    }
  },

  -- add, modify, remove plugins
  user = require("custom.plugins"),
}

-- check core.mappings for table structure
M.mappings = require("custom.mappings")

return M
