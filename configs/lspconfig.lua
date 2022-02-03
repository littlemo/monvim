local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config

  -- lspconfig.pyright.setup {
  --   on_attach = attach,
  --   capabilities = capabilities,
  --   flags = {
  --     debounce_text_changes = 150,
  --   },
  -- }

  lspconfig.jedi_language_server.setup {
    on_attach = attach,
    capabilities = capabilities,
    single_file_support = true,
    flags = {
      debounce_text_changes = 150,
    },
  }
end

return M
