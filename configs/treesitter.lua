local present, ts_config = pcall(require, "nvim-treesitter.configs")

if not present then
  return
end

ts_config.setup {
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
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = {
    enable = true,
  },
}

