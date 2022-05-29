return {
  -- 功能增强
  ["tpope/vim-surround"] = {
    event = 'BufRead',
    setup = function ()
      require("core.utils").packer_lazy_load "vim-surround"
    end,
  },
  ["tpope/vim-repeat"] = {
    event = 'BufRead',
    setup = function ()
      require("core.utils").packer_lazy_load "vim-repeat"
    end,
  },
  ["ethanholz/nvim-lastplace"] = {
    -- NOTE: 此处需启动时加载插件，否则无法生效
    config = function()
      require("custom.plugins.configs.others").lastplace()
    end,
  },

  -- 版本管理
  ["tpope/vim-fugitive"] = {
    cmd = "Git",
    setup = function()
      require("core.utils").packer_lazy_load "vim-fugitive"
    end,
  },
}
