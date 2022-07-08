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
    ["<C-f>"] = { "<Right>", "  forward character" },
    ["<C-b>"] = { "<Left>", "  backward character" },
    ["<C-a>"] = { "<ESC>^i", "論 beginning of line" },
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
    ["<leader>tb"] = { ":Gitsigns toggle_current_line_blame<CR>", "   开关当前行 blame 显示" }
  }
}

M.fugitive = {
  n = {
    ["<leader>gb"] = { ":Git blame<CR>", "   全文 blame 显示" }
  }
}

M.crosshairs = {
  n = {
    ["<leader>tc"] = { ":set cursorline! cursorcolumn!<CR>", "   开关十字光标" }
  }
}

return M
