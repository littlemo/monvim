-- (suggestion) -> lua/custom/plugins/init.lua or anywhere in custom dir

return {
  -- LSP
  { -- null-ls.nvim
    -- 代码语法检查&格式化
    "jose-elias-alvarez/null-ls.nvim",
    after = "nvim-lspconfig",
    config = function()
      require("custom.configs.null-ls").setup()
    end,
  },
  { -- nvim-lsp-installer
    'williamboman/nvim-lsp-installer',
    cmd = {'LspInstallInfo', 'LspInstall', 'LspUninstall', 'LspUninstallAll', 'LspInstallLog', 'LspPrintInstalled'},
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
  { -- vim-startuptime
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
  },
  { -- which-key.nvim
    "folke/which-key.nvim",
    event = 'BufRead',
    config = function()
      require('custom.configs.which-key').config()
    end,
  },
  { -- plantuml-syntax
    "aklt/plantuml-syntax",
    ft = {'pu', 'uml', 'puml', 'iuml', 'plantuml'},
    config = function()
      vim.cmd [[
        let g:plantuml_executable_script = get(
          \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
          \  1,
          \  0
          \)
      ]]
    end,
  },
  { -- open-browser.vim
    "tyru/open-browser.vim",
    cmd = 'PlantumlOpen',
  },
  { -- plantuml-previewer.vim
    "weirongxu/plantuml-previewer.vim",
    after = {"open-browser.vim"},
    cmd = 'PlantumlOpen',
    config = function ()
      vim.cmd [[
        let g:plantuml_previewer#plantuml_jar_path = get(
          \  matchlist(system('cat `which plantuml` | grep plantuml.jar'), '\v.*\s[''"]?(\S+plantuml\.jar).*'),
          \  1,
          \  0
          \)
        let g:plantuml_previewer#save_format = 'svg'
      ]]
    end,
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
  { -- vim-surround
    'tpope/vim-surround',
    event = 'BufRead',
    setup = function()
      require('core.utils').packer_lazy_load('vim-surround')
    end,
  },
  { -- vim-repeat
    'tpope/vim-repeat',
    event = 'BufRead',
    setup = function()
      require('core.utils').packer_lazy_load('vim-repeat')
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
  { -- dial.nvim
    -- 增强原生 <C-a> / <C-x> 的自增自减功能
    'monaqa/dial.nvim',
    event = 'BufRead',
    tag = 'v0.2.0',
    config = function()
      require("custom.configs.dial").config()
    end,
  },
  { -- vim-textobj-user
    'kana/vim-textobj-user',
    event = 'BufRead'
  },
  { -- vim-textobj-parameter
    'sgur/vim-textobj-parameter',
    event = 'BufRead',
    after = 'vim-textobj-user'
  },
  { -- nvim-revJ.lua
    -- 支持行拆分功能，与 join-line(J) 相反
    'AckslD/nvim-revJ.lua',
    event = 'BufRead',
    after = {'vim-textobj-user', 'vim-textobj-parameter'},
    config = function()
      require("revj").setup {
          brackets = {first = '([{<', last = ')]}>'}, -- brackets to consider surrounding arguments
          new_line_before_last_bracket = true, -- add new line between last argument and last bracket (only if no last seperator)
          add_seperator_for_last_parameter = true, -- if a seperator should be added if not present after last parameter
          enable_default_keymaps = false, -- enables default keymaps without having to set them below
          keymaps = {
              operator = '<localleader>j', -- for operator (+motion)
              line = '<localleader>J', -- for formatting current line
              visual = '<localleader>J', -- for formatting visual selection
          },
          parameter_mapping = ',', -- specifies what text object selects an arguments (ie a, and i, by default)
              -- if you're using `vim-textobj-parameter` you can also set this to `vim.g.vim_textobj_parameter_mapping`
      }
    end,
  },
  { -- nvim-treesitter-context
    'romgrk/nvim-treesitter-context',
    event = 'BufRead',
    after = 'nvim-treesitter'
  },
  { -- pretty-fold.nvim
    'anuvyklack/pretty-fold.nvim',
    event = 'BufRead',
    config = function()
      require('pretty-fold').setup({
        keep_indentation = false,
        fill_char = '•',
        sections = {
          left = {
            '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣━'
          },
          right = {
            '━┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
          }
        }
      })
      require('pretty-fold.preview').setup({
        border = 'rounded',
      })
    end,
  },
  { -- tabout.nvim
    'abecodes/tabout.nvim',
    event = 'InsertEnter',
    requires = 'nvim-treesitter',
    after = 'nvim-cmp',
    config = function()
      require('custom.configs.tabout').config()
    end,
  },
  { -- iswap.nvim
    'mizlan/iswap.nvim',
    cmd = 'ISwapWith',
    requires = 'nvim-treesitter',
    config = function()
      require('iswap').setup({
        autoswap = true,
      })
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
  },
  { -- rnvimr
    'kevinhwang91/rnvimr',
    cmd = 'RnvimrToggle',
    run = 'pip3 install ranger-fm pynvim && brew install highlight',
    config = function()
      vim.cmd [[ tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR> ]]
      vim.cmd [[ nnoremap <silent> <localleader>e :RnvimrToggle<CR> ]]
      vim.cmd [[ tnoremap <silent> <localleader>e <C-\><C-n>:RnvimrToggle<CR> ]]
      vim.g.rnvimr_enable_ex = 1
      vim.g.rnvimr_enable_picker = 1
      vim.g.rnvimr_enable_bw = 1
      vim.g.rnvimr_shadow_winblend = 20
      vim.cmd [[ highlight link RnvimrNormal CursorLine ]]
      vim.cmd [[ let g:rnvimr_action = {
        \  '<C-t>': 'NvimEdit tabedit',
        \  '<C-x>': 'NvimEdit split',
        \  '<C-v>': 'NvimEdit vsplit',
        \  '<C-o>': 'NvimEdit drop',
        \  'gw': 'JumpNvimCwd',
        \  'yw': 'EmitRangerCwd'
        \}
      ]]
    end,
    setup = function()
      require("core.utils").packer_lazy_load("rnvimr")
    end,
  },
  { -- wilder.nvim
    -- 增强 cmdline 补全&提示功能
    'gelguy/wilder.nvim',
    event = 'CmdlineEnter',
    run = 'brew install fd',
    config = function()
      require("custom.configs.wilder").setup()
    end,
  },
  { -- toggleterm.nvim
    'akinsho/toggleterm.nvim',
    cmd = { 'ToggleTerm', 'ToggleLazygit' },
    config = function()
      require("custom.configs.toggleterm").config()
    end,
    setup = function()
      require("custom.configs.toggleterm").setup()
    end,
  },
}

