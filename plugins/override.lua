local M = {}

M.treesitter = {
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
}

M.gitsigns = {
  current_line_blame = false,
  current_line_blame_opts = {
    delay = 200,
    ignore_whitespace = true,
  },
  current_line_blame_formatter = '    <author>   <author_time:%Y-%m-%d>   <summary>  <abbrev_sha>',
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server" ,
    "stylua",

    -- python stuff
    "jedi-language-server",
    "black",
    "isort",
  },
}

return M
