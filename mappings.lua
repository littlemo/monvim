local M = {}

M.disabled = {
  n = {
    ["<leader>/"] = "",
    ["<leader>e"] = "",
    ["<leader>n"] = "",
    ["<leader>rn"] = "",
  },
  i = {
    ["<C-h>"] = "",
    ["<C-l>"] = "",
  },
  v = {
    ["<leader>/"] = "",
  },
}

M.general = {
  n = {
    ["q"] = { ":q<CR>", "  quit" },
    ["Q"] = { ":qa<CR>", "  quit all" },
    ["<localleader>q"] = { "q", "壘  record" },
    ["<localleader>Q"] = { "@q", "奈  play record" },

    -- line numbers
    ["<leader>tn"] = { "<cmd> set nu! <CR>", "   toggle line number" },
    ["<leader>tr"] = { "<cmd> set rnu! <CR>", "   toggle relative number" },

    -- copy path
    ["yp"] = { ":let @+=expand(\"%:~:.\")<CR>:echo '✋ 复制相对路径完成！'<CR>", "   yank relative path" },
    ["yP"] = { ":let @+=expand(\"%:p\")<CR>:echo '✋ 复制绝对路径完成！'<CR>", "   yank absolute path" },
  },
  i = {
    ["<C-a>"] = { "<Home>", "論 beginning of line" },
    ["<C-f>"] = { "<Right>", "  forward character" },
    ["<C-b>"] = { "<Left>", "  backward character" },
    ["<C-n>"] = { "<Down>", " move down" },
    ["<C-p>"] = { "<Up>", " move up" },
    ["<C-j>"] = { "<C-n>", " Find next match" },
    ["<C-k>"] = { "<C-p>", " Find previous match" },
  },
  x = {
    ["<"] = { "<gv", "   左缩进" },
    [">"] = { ">gv", "   右缩进" },
  },
}

M.rnvimr = {
  n = {
    ["<C-n>"] = { "<cmd> RnvimrToggle <CR>", "   toggle rnvimr" },
  },
  t = {
    ["<C-n>"] = { "<cmd> RnvimrToggle <CR>", "   toggle rnvimr" },
  }
}

M.asterisk = {
  n = {
    ["*"] = { "<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>", " search forward"},
    ["#"] = { "<Plug>(asterisk-z#)<Cmd>lua require('hlslens').start()<CR>", " search backward"},
    ["g*"] = { "<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>", " g search forward"},
    ["g#"] = { "<Plug>(asterisk-gz#)<Cmd>lua require('hlslens').start()<CR>", " g search backward"},
  }
}

M.gitsigns = {
  n = {
    ["<leader>tb"] = { ":Gitsigns toggle_current_line_blame<CR>", "   Toggle current line blame" }
  }
}

M.fugitive = {
  n = {
    ["<leader>gb"] = { ":Git blame<CR>", "   File blame" }
  }
}

M.crosshairs = {
  n = {
    ["<leader>tc"] = { ":set cursorline! cursorcolumn!<CR>", "   Toggle crosshairs" }
  }
}

M.lspconfig = {
  v = {
    ["<leader>fm"] = {
      function()
        vim.lsp.buf.range_formatting()
      end,
      "   lsp range formatting",
    },
  }
}

M.neotest = {
  n = {
    ["<C-p><C-t>"] = { ":lua require('neotest').run.run()<CR>", "ﭧ   Run the nearest test" },
    ["<C-p>t"] = { ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "ﭧ   Run the current file" },
    ["<C-p><C-a>"] = { ":lua require('neotest').run.attach()<CR>", "ﭧ   Attach to a running process" },

    ["<C-p><C-o>"] = { ":lua require('neotest').output.open()<CR>", "   Open test result output" },
    ["<C-p><C-o><C-o>"] = { ":lua require('neotest').output.open({ enter = true })<CR>", "   Open test result output & Enter" },
    ["<C-p>oo"] = { ":lua require('neotest').output.open({ short = true, enter = true })<CR>", "   Open test shortened output & Enter" },

    ["<C-p><C-s>"] = { ":lua require('neotest').summary.toggle()<CR>", "פּ   Toggle test summary window" },
  },
}

M.coverage = {
  n = {
    ["<leader>cs"] = { ":CoverageSummary<CR>", "   coverage summary report" },
    ["<leader>cl"] = { ":CoverageLoad<CR>"   , "勒  Loads a coverage report" },
    ["<leader>ct"] = { ":CoverageToggle<CR>" , "   Toggles coverage signs" },
  },
}

M.dap = {
  n = {
    ["<leader>db"] = { ":lua require('dap').toggle_breakpoint()<CR>", "toggle breakpoint" },
    ["<leader>dB"] = { ":lua require('dap').set_breakpoint(vim.fn.input '[Condition] > ')<CR>", "set condition breakpoint" },
    ["<leader>dr"] = { ":lua require('dap').repl.open()<CR>", "open repl" },
    ["<leader>dl"] = { ":lua require('dap').run_last()<CR>", "run last" },
    ["<leader>dq"] = { ":lua require('dap').terminate()<CR>", "terminate" },
    ["<leader>dt"] = { ":lua require('dap-python').test_method()<CR>", "debug test method" },
    ["<leader>dT"] = { ":lua require('dap-python').test_class()<CR>", "debug test class" },
    ["<M-c>"] = { ":lua require('dap').continue()<CR>", "continue" },
    ["<M-s>"] = { ":lua require('dap').step_into()<CR>", "step into" },
    ["<M-n>"] = { ":lua require('dap').step_over()<CR>", "step over" },
    ["<M-r>"] = { ":lua require('dap').step_out()<CR>", "step out" },
    ["<M-k>"] = { ":lua require('dapui').eval()<CR>", "eval" },
  },
  v = {
    ["<leader>ds"] = { "<ESC>:lua require('dap-python').debug_selection()<CR>", "debug selection" },
  },
}

return M
