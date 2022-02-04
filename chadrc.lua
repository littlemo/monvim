-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

-- 显示样式 {{{
M.ui = {
   theme = "tomorrow-night",
}
-- }}}
-- 插件配置 {{{
-- Install plugins
local userPlugins = require "custom.plugins"

M.plugins = {
  install = userPlugins,
  status = {
    nvimtree = false,  -- 关闭 nvimtree 插件
  },
  options = {
    nvimtree = {
      enable_git = 1,
    },
    lspconfig = {
      setup_lspconf = "custom.configs.lspconfig"
    },
  },
  default_plugin_config_replace = {
    nvim_tree = "custom.configs.nvimtree",
    nvim_treesitter = "custom.configs.treesitter",
    gitsigns = "custom.configs.gitsigns",
  },
}
-- }}}
-- 按键映射 {{{
-- 非插件映射
M.mappings = {
  misc = {
    copy_whole_file = "<A-y>",
  },

  insert_nav = {
    backward = "<C-b>",
    forward = "<C-f>",
  },

  terminal = {
    esc_termmode = { "<C-[>" },
  },
}

-- 插件相关的按键映射
M.mappings.plugins = {
  bufferline = {
    next_buffer = "gn",
    prev_buffer = "gp",
  },

  comment = {
    toggle = "gcc",
  },

  nvimtree = {
    toggle = "<localleader>e",
    focus = "<localleader>a",
  },

  telescope = {
    buffers = "<localleader>fb",
    find_files = "<localleader>ff",
    find_hiddenfiles = "<localleader>fa",
    live_grep = "<localleader>fw",
    oldfiles = "<localleader>fo",
    git_commits = "<localleader>fc",
    git_status = "<localleader>fs",
  },
}
-- }}}

return M
