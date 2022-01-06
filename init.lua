-- This is an example init file , its supposed to be placed in /lua/custom dir
-- lua/custom/init.lua

-- This is where your custom modules and plugins go.
-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!

local hooks = require "core.hooks"

-- 全局按键配置 {{{
vim.g.maplocalleader = ';'
vim.g.did_load_filetypes = 1

-- neovide 配置
vim.o.guifont = 'Hack Nerd Font Mono'
vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_vfx_mode = "railgun"
-- }}}

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
	local opt = { noremap = true, silent = true }
	-- 功能开关 {{{
	map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opt)
	-- }}}
	-- 插件映射 {{{
  map("n", "<leader>cc", ":Telescope <CR>", opt)
  map("v", "<leader>fm", ":lua vim.lsp.buf.range_formatting()<CR>", opt)
  map("n", "<leader>gb", ":Git blame<CR>", opt)
	-- }}}
	-- 功能增强 {{{
  map("n", "q", ":q <CR>", opt)
	-- 代码块缩进 {{{
	map("x", "<", "<gv", opt)
	map("x", ">", ">gv", opt)
	-- }}}
  -- 快速复制当前文件路径 {{{
  map("n", "<leader>y", ":let @+=expand(\"%:~:.\")<CR>:echo '✋ 复制相对路径完成！'<CR>", opt)
  map("n", "<leader>Y", ":let @+=expand(\"%:p\")<CR>:echo '✋ 复制绝对路径完成！'<CR>", opt)
	-- }}}
	-- }}}
end)


-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

-- Install plugins
-- To add new plugins, use the "install_plugins" hook,

-- examples below:

hooks.add("install_plugins", function(use)
  use { -- 代码语法检查&格式化 {{{
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  } -- }}}
  use { -- 平滑滚动 {{{
    "karb94/neoscroll.nvim",
    opt = true,
    config = function()
      require("neoscroll").setup()
    end,

    -- lazy loading
    setup = function()
      require("core.utils").packer_lazy_load("neoscroll.nvim")
    end,
  } -- }}}
  use { -- 文件类型检测 {{{
    "nathom/filetype.nvim",
  } -- }}}
  use { -- 分屏时稳定内容显示 {{{
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  } -- }}}
  use { -- Markdown预览 {{{
    "davidgranstrom/nvim-markdown-preview",
    config = function()
      require("stabilize").setup()
    end,
  } -- }}}
	use { -- Git封装 {{{
		"tpope/vim-fugitive",
		setup = function()
			require("core.utils").packer_lazy_load("vim-fugitive")
		end
	} -- }}}
	-- 编辑支持 {{{
	use { -- 在上次编辑的位置打开文件 {{{
		'ethanholz/nvim-lastplace',
		config = function()
			require'nvim-lastplace'.setup {
				lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
				lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
				lastplace_open_folds = true
			}
		end,
	} -- }}}
		-- }}}
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

-- vim: set foldmethod=marker ts=2 sw=2 tw=80 noet :
