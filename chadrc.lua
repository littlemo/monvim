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
M.plugins = {
  options = {
    nvimtree = {
      enable_git = 1,
    },
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig"
    },
  },
  default_plugin_config_replace = {
    nvim_tree = "custom.plugins.nvimtree",
    nvim_treesitter = "custom.plugins.treesitter",
  },
}
-- }}}
-- 按键映射 {{{
-- 非插件映射
M.mappings = {
  insert_nav = {
    backward = "<C-b>",
    forward = "<C-f>",
  },
}

-- 插件相关的按键映射
M.mappings.plugins = {
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
