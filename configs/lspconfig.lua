local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  local servers = {
    "sumneko_lua",  -- 安装 brew install lua-language-server
    "jedi_language_server",  -- 安装 pip3 install -U jedi-language-server
    "pyright",  -- 安装 pip3 install pyright / npm install -g pyright
  }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
      single_file_support = true,
      flags = {
        debounce_text_changes = 150,
      },
    }
  end
end

return M
