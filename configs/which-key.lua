local M = {}
M.config = function()
  local wk = require("which-key")
  wk.register({
    ["<leader>f"] = {
      name = "文件/查找",
      f = { "<cmd>Telescope find_files<cr>", "Find File" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      n = { "<cmd>enew<cr>", "New File" },
      b = { "<cmd>Telescope<cr>", "Builtin" },
    },
    ["<leader>y"] = {"复制相对路径"},
    ["<leader>Y"] = {"复制绝对路径"},
    ["<leader>g"] = {"Git"},
    ["<leader>s"] = {"水平分屏终端"},
    ["<leader>v"] = {"垂直分屏终端"},
    ["<leader>d"] = {"代码调试"},
    ["<leader>h"] = {"Git块操作"},
    ["<leader>t"] = {
      name = "开关操作",
      n = {"开关行号"},
      r = {"开关相对行号"},
    },
  })
end
return M
