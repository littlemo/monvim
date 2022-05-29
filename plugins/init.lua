return {
  -- 通用操作
  ["tpope/vim-surround"] = {
    event = 'BufRead',
    setup = function ()
      nvchad.packer_lazy_load "vim-surround"
    end,
  },
  ["tpope/vim-repeat"] = {
    event = 'BufRead',
    setup = function ()
      nvchad.packer_lazy_load "vim-repeat"
    end,
  },
}
