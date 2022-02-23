local null_ls = require "null-ls"
local b = null_ls.builtins

local sources = {

  -- fe
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css" } },
  -- b.formatting.deno_fmt,

  -- Lua
  -- b.formatting.stylua,
  b.diagnostics.luacheck.with { extra_args = { "--globals vim" } },

  -- Shell
  -- b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- python
  -- b.formatting.reorder_python_imports,
  b.formatting.isort,
  b.formatting.yapf,
  -- b.diagnostics.flake8,

  -- misc
  b.formatting.json_tool,
  b.code_actions.gitsigns,
}

local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    -- format on save
    -- on_attach = function(client)
    --   if client.resolved_capabilities.document_formatting then
    --     vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
    --   end
    -- end,
  }
end

return M
