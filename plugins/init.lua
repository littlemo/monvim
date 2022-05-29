return {
  -- 通用操作
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

  -- 版本管理
  ["tpope/vim-fugitive"] = {
    cmd = "Git",
    setup = function()
      require("core.utils").packer_lazy_load "vim-fugitive"
    end,
  },
}
