-- 全局按键配置
vim.g.maplocalleader = ';'
vim.g.did_load_filetypes = 1

-- neovide 配置
vim.o.guifont = 'Hack Nerd Font Mono'
-- vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_vfx_mode = "railgun"

if vim.g.nvui then
  -- Configure through vim commands
  vim.cmd [[NvuiCmdFontFamily Hack Nerd Font Mono]]
  vim.cmd [[NvuiCmdFontSize 20.0]]
  vim.cmd [[NvuiScrollAnimationDuration 0.1]]
  vim.cmd [[autocmd InsertEnter * NvuiIMEEnable]]
  vim.cmd [[autocmd InsertLeave * NvuiIMEDisable]]
end

-- json 格式化
vim.cmd [[ com! FormatJSON %!python3 -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=4))" ]]

-- MAPPINGS
local map = require("core.utils").map
local opt = { noremap = true, silent = true }

-- 功能增强
map("n", "q", ":q <CR>", opt)
map("n", "Q", ":qa <CR>", opt)
map("n", "<localleader>q", "q", opt)
map("n", "<localleader>Q", "@q", opt)
-- 代码块缩进
map("x", "<", "<gv", opt)
map("x", ">", ">gv", opt)

-- 窗口尺寸
map("", "<A-h>", "<C-w><", opt)
map("", "<A-j>", "<C-w>-", opt)
map("", "<A-k>", "<C-w>+", opt)
map("", "<A-l>", "<C-w>>", opt)

-- 快速复制当前文件路径
map("n", "<leader>y", ":let @+=expand(\"%:~:.\")<CR>:echo '✋ 复制相对路径完成！'<CR>", opt)
map("n", "<leader>Y", ":let @+=expand(\"%:p\")<CR>:echo '✋ 复制绝对路径完成！'<CR>", opt)

-- 功能开关
map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opt)

-- 插件映射
map("n", "<leader>cc", ":Telescope <CR>", opt)
map("v", "<leader>fm", ":lua vim.lsp.buf.range_formatting()<CR>", opt)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
