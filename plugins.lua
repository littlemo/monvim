-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
  -- LSP
  { -- null-ls.nvim
    -- 代码语法检查&格式化
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.plugins.null-ls").setup()
    end,
  },
  -- 代码调试
  { -- vimspector
    "puremourning/vimspector",
    cmd = "VimspectorReset",
    run = "./install_gadget.py --enable-python",
    config = function()
      vim.api.nvim_set_keymap('n', '<leader>di', '<Plug>VimspectorBalloonEval', {})
      vim.api.nvim_set_keymap('x', '<leader>di', '<Plug>VimspectorBalloonEval', {})
      vim.api.nvim_set_keymap('n', '<leader>dn', '<Plug>VimspectorStepOver', {})
      vim.api.nvim_set_keymap('n', '<leader>ds', '<Plug>VimspectorStepInto', {})
      vim.api.nvim_set_keymap('n', '<leader>dr', '<Plug>VimspectorStepOut', {})
      vim.api.nvim_set_keymap('n', '<leader>dt', '<Plug>VimspectorRunToCursor', {})
      vim.api.nvim_set_keymap('n', '<leader>db', '<Plug>VimspectorToggleBreakpoint', {})
      vim.api.nvim_set_keymap('n', '<leader>dq', ':VimspectorReset<CR>', {})
    end,
    setup = function()
      vim.g.vimspector_enable_mappings = 'HUMAN'
      require("core.utils").packer_lazy_load("vimspector")
    end,
  },
  { -- sniprun
    'michaelb/sniprun',
    event = "BufRead",
    run = 'bash ./install.sh',
    config = function()
      require("sniprun").setup({
        repl_enable = {'Python3_original'}
      })
      vim.api.nvim_set_keymap('n', '<C-c>', '<Plug>SnipRunOperator', {silent = true})
      vim.api.nvim_set_keymap('v', '<C-c><C-e>', '<Plug>SnipRun', {silent = true})  -- 意为 command execute
      vim.api.nvim_set_keymap('n', '<C-c><C-e>', '<Plug>SnipRun', {silent = true})
      vim.api.nvim_set_keymap('i', '<C-c><C-e>', '<ESC>:SnipRun<CR>A', {silent = true})
    end,
    setup = function()
      require("core.utils").packer_lazy_load("sniprun")
    end,
  },
  -- misc
  { -- filetype.nvim
    -- 文件类型检测
    "nathom/filetype.nvim",
    config = function()
      vim.cmd [[ autocmd Filetype python setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() expandtab tabstop=4 shiftwidth=4 softtabstop=4 nofoldenable ]]
      vim.cmd [[ autocmd Filetype markdown setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() noexpandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]
      vim.cmd [[ autocmd Filetype lua setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() expandtab tabstop=2 shiftwidth=2 softtabstop=2 ]]
      vim.cmd [[ autocmd Filetype json setlocal foldmethod=indent expandtab tabstop=4 shiftwidth=4 softtabstop=4 ]]
      vim.cmd [[ autocmd Filetype yaml setlocal foldmethod=indent expandtab tabstop=2 shiftwidth=2 softtabstop=2 ]]
    end,
  },
  { -- vim-startuptime
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  -- 分屏&窗口
  { -- stabilize.nvim
    -- 分屏时稳定内容显示
    "luukvbaal/stabilize.nvim",
    config = function()
      require("stabilize").setup()
    end,
  },
  -- Markdown
  { -- nvim-markdown-preview
    -- 动态预览
    "davidgranstrom/nvim-markdown-preview",
    cmd = "MarkdownPreview",
    setup = function()
      require("core.utils").packer_lazy_load("nvim-markdown-preview")
    end,
  },
  -- 语法
  { -- surround
    "blackCauldron7/surround.nvim",
    config = function()
      require"surround".setup({
        mappings_style = "surround"
      })
    end,
  },
  -- Git
  { -- vim-fugitive
    "tpope/vim-fugitive",
    cmd = "Git",
    config = function()
      vim.api.nvim_set_keymap("n", "<leader>gb", ":Git blame<CR>", {noremap = true, silent = true})
    end,
    setup = function()
      require("core.utils").packer_lazy_load("vim-fugitive")
    end,
  },
  -- 编辑支持
  { -- nvim-lastplace
    -- 在上次编辑的位置打开文件
    'ethanholz/nvim-lastplace',
    config = function()
      require'nvim-lastplace'.setup {
        lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
        lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
        lastplace_open_folds = true
      }
    end,
  },
  -- 光标线
  { -- nvim-cursorword
    "xiyaowong/nvim-cursorword",
    event = "BufRead",
    setup = function()
      require("core.utils").packer_lazy_load("nvim-cursorword")
    end
  },
  -- 搜索
  { -- nvim-hlslens
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
  },
  { -- vim-asterisk
    'haya14busa/vim-asterisk',
    after = "nvim-hlslens",
    event = "BufRead",
    config = function()
      vim.api.nvim_set_keymap('', '*', "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>", {})
      vim.api.nvim_set_keymap('', '#', "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>", {})
      vim.api.nvim_set_keymap('', 'g*', "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>", {})
      vim.api.nvim_set_keymap('', 'g#', "<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>", {})
    end,
    setup = function()
      require("core.utils").packer_lazy_load("vim-asterisk")
    end,
  }
}

