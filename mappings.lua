local M = {}

M.disabled = {
  n = {
    ["<leader>/"] = "",
  },
  v = {
    ["<leader>/"] = "",
  },
}

M.general = {
  i = {
    ["<C-f>"] = { "<Right>", "  forward character" },
    ["<C-b>"] = { "<Left>", "  backward character" },
    ["<C-a>"] = { "<ESC>^i", "論 beginning of line" },
  },
}

return M
