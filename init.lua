-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

local hooks = require "core.hooks"

-- 全局按键配置 {{{
vim.g.maplocalleader = ';'
vim.g.did_load_filetypes = 1
-- }}}

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
  map("n", "<leader>cc", ":Telescope <CR>", opt)
  map("n", "q", ":q <CR>", opt)
  map("v", "<leader>fm", ":lua vim.lsp.buf.range_formatting()<CR>", opt)
end)

-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

-- Install plugins
-- To add new plugins, use the "install_plugins" hook,

-- examples below:

hooks.add("install_plugins", function(use)
  use {
    -- 代码语法检查&格式化
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  }

  use {
    -- 平滑滚动
    "karb94/neoscroll.nvim",
    opt = true,
    config = function()
      require("neoscroll").setup()
    end,

    -- lazy loading
    setup = function()
      require("core.utils").packer_lazy_load("neoscroll.nvim")
    end,
  }

  use {
    -- 文件类型检测
    "nathom/filetype.nvim",
  }

  use {
    -- 分屏时稳定内容显示
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  }
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
