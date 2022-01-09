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
-- vim.g.neovide_fullscreen = true
vim.g.neovide_cursor_vfx_mode = "railgun"

-- vimspector 配置
vim.g.vimspector_enable_mappings = 'HUMAN'
-- }}}

-- MAPPINGS
-- To add new plugins, use the "setup_mappings" hook,

hooks.add("setup_mappings", function(map)
  local opt = { noremap = true, silent = true }
  -- 功能增强 {{{
  map("n", "q", ":q <CR>", opt)
  map("n", "Q", "q", opt)
  map("n", "gQ", "@q", opt)
  -- 代码块缩进 {{{
  map("x", "<", "<gv", opt)
  map("x", ">", ">gv", opt)
  -- }}}
  -- 窗口尺寸 {{{
  map("", "<A-h>", "<C-w><", opt)
  map("", "<A-j>", "<C-w>-", opt)
  map("", "<A-k>", "<C-w>+", opt)
  map("", "<A-l>", "<C-w>>", opt)
  -- }}}
  -- 快速复制当前文件路径 {{{
  map("n", "<leader>y", ":let @+=expand(\"%:~:.\")<CR>:echo '✋ 复制相对路径完成！'<CR>", opt)
  map("n", "<leader>Y", ":let @+=expand(\"%:p\")<CR>:echo '✋ 复制绝对路径完成！'<CR>", opt)
  -- }}}
  -- }}}
  -- 功能开关 {{{
  map("n", "<leader>tb", ":Gitsigns toggle_current_line_blame<CR>", opt)
  -- }}}
  -- 插件映射 {{{
  map("n", "<leader>cc", ":Telescope <CR>", opt)
  map("v", "<leader>fm", ":lua vim.lsp.buf.range_formatting()<CR>", opt)
  map("n", "<leader>gb", ":Git blame<CR>", opt)

  vim.cmd("map *  <Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>")
  vim.cmd("map #  <Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>")
  vim.cmd("map g* <Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>")
  vim.cmd("map g# <Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>")

  -- 代码调试
  vim.cmd("nmap <leader>di <Plug>VimspectorBalloonEval")  -- for normal mode - the word under the cursor
  vim.cmd("xmap <leader>di <Plug>VimspectorBalloonEval")  -- for visual mode, the visually selected text
  vim.cmd("nmap <leader>dn <Plug>VimspectorStepOver")
  vim.cmd("nmap <leader>ds <Plug>VimspectorStepInto")
  vim.cmd("nmap <leader>dr <Plug>VimspectorStepOut")
  vim.cmd("nmap <leader>dt <Plug>VimspectorRunToCursor")
  vim.cmd("nmap <leader>db <Plug>VimspectorToggleBreakpoint")
  vim.cmd("nmap <leader>dq :VimspectorReset<CR>")
  -- }}}
end)


-- NOTE : opt is a variable  there (most likely a table if you want multiple options),
-- you can remove it if you dont have any custom options

-- Install plugins
-- To add new plugins, use the "install_plugins" hook,

-- examples below:

hooks.add("install_plugins", function(use)
  -- LSP {{{
  use { -- null-ls.nvim {{{
    -- 代码语法检查&格式化
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  } -- }}}
    -- }}}
  -- 代码调试 {{{
  use { -- vimspector {{{
    "puremourning/vimspector",
    event = "BufRead",
    setup = function()
      require("core.utils").packer_lazy_load("vimspector")
    end,
  } -- }}}
    -- }}}
  -- 滚屏 {{{
  use { -- neoscroll.nvim {{{
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
  } -- }}}
    -- }}}
  -- misc {{{
  use { -- filetype.nvim {{{
    -- 文件类型检测
    "nathom/filetype.nvim",
  } -- }}}
    -- }}}
  -- 分屏&窗口 {{{
  use { -- stabilize.nvim {{{
    -- 分屏时稳定内容显示
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  } -- }}}
    -- }}}
  -- Markdown {{{
  use { -- nvim-markdown-preview {{{
    -- 动态预览
    "davidgranstrom/nvim-markdown-preview",
    setup = function()
      require("core.utils").packer_lazy_load("nvim-markdown-preview")
    end,
  } -- }}}
    -- }}}
  -- Git {{{
  use { -- vim-fugitive {{{
    "tpope/vim-fugitive",
    event = "BufRead",
    setup = function()
      require("core.utils").packer_lazy_load("vim-fugitive")
    end,
  } -- }}}
    -- }}}
  -- 编辑支持 {{{
  use { -- nvim-lastplace {{{
    -- 在上次编辑的位置打开文件
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
  -- 光标线 {{{
  use { -- nvim-cursorword {{{
    "xiyaowong/nvim-cursorword",
    event = "BufRead",
    setup = function()
      require("core.utils").packer_lazy_load("nvim-cursorword")
    end
  } -- }}}
    -- }}}
  -- 搜索 {{{
  use { -- nvim-hlslens {{{
    'kevinhwang91/nvim-hlslens',
    event = "BufRead",
    config = function()
      require('hlslens').setup({
        -- 定制虚拟文字显示信息
        override_lens = function(render, plist, nearest, idx, r_idx)
          local sfw = vim.v.searchforward == 1
          local indicator, text, chunks
          local abs_r_idx = math.abs(r_idx)
          if abs_r_idx > 1 then
            indicator = ('%d%s'):format(abs_r_idx, sfw ~= (r_idx > 1) and '▲' or '▼')
          elseif abs_r_idx == 1 then
            indicator = sfw ~= (r_idx == 1) and '▲' or '▼'
          else
            indicator = ''
          end

          local lnum, col = unpack(plist[idx])
          if nearest then
            local cnt = #plist
            if indicator ~= '' then
              text = ('[%s %d/%d]'):format(indicator, idx, cnt)
            else
              text = ('[%d/%d]'):format(idx, cnt)
            end
            chunks = {{' ', 'Ignore'}, {text, 'HlSearchLensNear'}}
          else
            text = ('[%s %d]'):format(indicator, idx)
            chunks = {{' ', 'Ignore'}, {text, 'HlSearchLens'}}
          end
          render.set_virt(0, lnum - 1, col - 1, chunks, nearest)
        end
      })
    end
  } -- }}}
  use { -- vim-asterisk {{{
    'haya14busa/vim-asterisk',
    after = "nvim-hlslens",
    event = "BufRead",
    setup = function()
      require("core.utils").packer_lazy_load("vim-asterisk")
    end,
  } -- }}}
    -- }}}
end)

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough

-- vim: set foldmethod=marker ts=2 sw=2 tw=80 et :
