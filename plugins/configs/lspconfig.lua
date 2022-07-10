local M = {}

local merge_tb = vim.tbl_deep_extend

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require("lspconfig")

  -- lspservers with default config
  local servers = {
    ["jedi_language_server"] = require("custom.plugins.configs.lang.jedi_language_server"),
  }

  for server_name, server_opts in pairs(servers) do
    local opts = {
      on_attach = attach,
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      settings = {},
    }
    opts = merge_tb("force", opts, server_opts)

    -- 基于项目的本地配置
    local f = loadfile(vim.fn.getcwd() .. '/.lspconfig.lua')
    if f ~= nil then
      local local_cfg = f()
      opts = merge_tb("force", opts, local_cfg)
    end

    lspconfig[server_name].setup(opts)
  end
end

return M
