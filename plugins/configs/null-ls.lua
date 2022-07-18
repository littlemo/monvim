local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt,
  -- b.formatting.prettier,

  -- gitsigns
  b.code_actions.gitsigns,

  -- luasnip
  b.completion.luasnip,

  -- make
  b.diagnostics.checkmake,

  -- python
  -- b.diagnostics.flake8,
  -- b.diagnostics.pydocstyle,
  b.diagnostics.pylint.with({
    extra_args = {
      "--max-line-length", "120",
    },
    diagnostics_postprocess = function(diagnostic)
      -- 自定义 pylint 的输出样式，追加 symbol 信息
      diagnostic.message = string.format(
        "[%s]<%s> %s (%s)",
        diagnostic.source,
        diagnostic.code,
        diagnostic.message,
        diagnostic.symbol)
    end,
  }),
  -- b.diagnostics.vulture.with({
  --   extra_args = {"--min-confidence", "65"},
  -- }),
  b.diagnostics.pylama.with({
    -- eradicate,mccabe,mypy,pycodestyle,pydocstyle,pyflakes,pylint,isort
    extra_args = {
      "--linters", "mccabe,pycodestyle,vulture",
      "--vulture-min-confidence", "65",
      "--max-line-length", "120",
    },
  }),
  b.formatting.usort,
  -- b.formatting.reorder_python_imports,
  -- b.formatting.isort,
  -- b.formatting.autopep8,
  b.formatting.black,
  -- b.formatting.yapf,

  -- json
  b.formatting.jq,

  -- zsh
  b.diagnostics.zsh,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck,

  -- other
  b.formatting.trim_newlines,
}

local config = {
  -- debug = true,
  sources = sources,
  diagnostics_format = "[#{s}]<#{c}> #{m}",
}

null_ls.setup(config)
