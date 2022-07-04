return {
  -- 功能增强
  ["tpope/vim-surround"] = {
    event = 'BufRead',
  },
  ["tpope/vim-repeat"] = {
    event = 'BufRead',
  },
  ["ethanholz/nvim-lastplace"] = {
    -- NOTE: 此处需启动时加载插件，否则无法生效
    config = function()
      require("custom.plugins.configs.others").lastplace()
    end,
  },
  ["kevinhwang91/rnvimr"] = {
    cmd = "RnvimrToggle",
    run = "pip3 install ranger-fm pynvim",
    config = function()
      require("custom.plugins.configs.rnvimr")
    end,
  },
  ["kevinhwang91/nvim-hlslens"] = {
    event = "BufRead",
    config = function()
      require("custom.plugins.configs.hlslens")
    end
  },
  ["haya14busa/vim-asterisk"] = {
    after = "nvim-hlslens",
    event = "BufRead",
  },
  ["xiyaowong/nvim-cursorword"] = {
    event = "BufRead",
  },
  ["anuvyklack/pretty-fold.nvim"] = {
    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
    event = 'BufRead',
    config = function()
      require("custom.plugins.configs.others").prettyfold()
    end,
  },
  ["monaqa/dial.nvim"] = {
    event = "BufRead",
    config = function()
      require("custom.plugins.configs.dial")
    end,
  },

  -- 版本管理
  ["tpope/vim-fugitive"] = {
    cmd = "Git",
  },
}
