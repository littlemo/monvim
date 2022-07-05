return {
  -- 功能增强
  ["tpope/vim-surround"] = {  -- 围绕选择
    event = 'BufRead',
  },
  ["tpope/vim-repeat"] = {  -- 点模式增强
    event = 'BufRead',
  },
  ["farmergreg/vim-lastplace"] = {  -- 恢复上次关闭时的位置
    -- NOTE: 此处需启动时加载插件，否则无法生效
    config = function ()
      require("custom.plugins.configs.others").lastplace()
    end,
  },
  ["bronson/vim-crosshairs"] = {  -- 十字准线
    config = function ()
      require("custom.plugins.configs.others").crosshairs()
    end,
  },
  ["kevinhwang91/rnvimr"] = {  -- ranger 文件管理器集成
    cmd = "RnvimrToggle",
    run = "pip3 install ranger-fm pynvim",
    config = function ()
      require("custom.plugins.configs.rnvimr")
    end,
  },
  ["kevinhwang91/nvim-hlslens"] = {  -- 匹配高亮
    event = "BufRead",
    config = function ()
      require("custom.plugins.configs.hlslens")
    end
  },
  ["haya14busa/vim-asterisk"] = {  -- 星匹配增强
    after = "nvim-hlslens",
    event = "BufRead",
  },
  ["xiyaowong/nvim-cursorword"] = {  -- 高亮当前光标所在词
    event = "BufRead",
  },
  ["anuvyklack/pretty-fold.nvim"] = {  -- 代码折叠预览
    requires = 'anuvyklack/nvim-keymap-amend', -- only for preview
    event = 'BufRead',
    config = function ()
      require("custom.plugins.configs.others").prettyfold()
    end,
  },
  ["monaqa/dial.nvim"] = {  -- 光标词加减增强
    event = "BufRead",
    config = function()
      require("custom.plugins.configs.dial")
    end,
  },

  -- 版本管理
  ["tpope/vim-fugitive"] = {  -- Git 集成
    cmd = "Git",
  },
}
