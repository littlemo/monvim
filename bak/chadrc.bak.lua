-- This is an example chadrc file , its supposed to be placed in /lua/custom dir
-- lua/custom/chadrc.lua

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

-- 显示样式 {{{
M.ui = {
   theme = "tomorrow-night",
}
-- }}}
-- 插件配置 {{{
-- Install plugins
local userPlugins = require "custom.plugins"

M.plugins = {
  install = userPlugins,
  status = {
    nvimtree = false,  -- 关闭 nvimtree 插件
  },
  options = {
    lspconfig = {
      setup_lspconf = "custom.configs.lspconfig"
    },
  },
  default_plugin_config_replace = {
    nvim_treesitter = {
      ensure_installed = {
        "bash",
        "cmake",
        "css",
        "dockerfile",
        "dot",
        "html",
        "http",
        "java",
        "javascript",
        "hjson",
        "latex",
        "lua",
        "make",
        "markdown",
        "python",
        "r",
        "rst",
        "scss",
        "vim",
        "vue",
        "yaml",
      },
      indent = {
        enable = true,
      },
    },
    gitsigns = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
        ignore_whitespace = true,
      },
      on_attach = function(bufnr)
        local function map(mode, lhs, rhs, opts)
            opts = vim.tbl_extend('force', {noremap = true, silent = true}, opts or {})
            vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
        end

        -- Navigation
        map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
        map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})

        -- Actions
        map('n', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('v', '<leader>hs', ':Gitsigns stage_hunk<CR>')
        map('n', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('v', '<leader>hr', ':Gitsigns reset_hunk<CR>')
        map('n', '<leader>hS', '<cmd>Gitsigns stage_buffer<CR>')
        map('n', '<leader>hu', '<cmd>Gitsigns undo_stage_hunk<CR>')
        map('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<CR>')
        map('n', '<leader>hp', '<cmd>Gitsigns preview_hunk<CR>')
        map('n', '<leader>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>')
        map('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<CR>')
        map('n', '<leader>hd', '<cmd>Gitsigns diffthis<CR>')
        map('n', '<leader>hD', '<cmd>lua require"gitsigns".diffthis("~")<CR>')
        map('n', '<leader>td', '<cmd>Gitsigns toggle_deleted<CR>')

        -- Text object
        map('o', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
        map('x', 'ih', ':<C-U>Gitsigns select_hunk<CR>')
      end
    },
  },
}
-- }}}
-- 按键映射 {{{
-- 非插件映射
M.mappings = {
  misc = {
    copy_whole_file = "<A-y>",
    line_number_toggle = "<leader>tn",
    relative_line_number_toggle = "<leader>tr",
  },

  insert_nav = {
    backward = "<C-b>",
    forward = "<C-f>",
  },

  terminal = {
    esc_termmode = { "<C-[>" },
  },
}

-- 插件相关的按键映射
M.mappings.plugins = {
  bufferline = {
    next_buffer = "gn",
    prev_buffer = "gp",
  },

  comment = {
    toggle = "gcc",
  },

  nvimtree = {
    toggle = "<localleader>e",
    focus = "<localleader>a",
  },

  telescope = {
    buffers = "<localleader>fb",
    find_files = "<localleader>ff",
    find_hiddenfiles = "<localleader>fa",
    live_grep = "<localleader>fw",
    oldfiles = "<localleader>fo",
    git_commits = "<localleader>fc",
    git_status = "<localleader>fs",
  },
}
-- }}}

return M
