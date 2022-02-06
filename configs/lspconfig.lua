local M = {}

M.setup_lsp = function(attach, capabilities)
  local lsp_installer = require('nvim-lsp-installer')
  local lsp_installer_servers = require('nvim-lsp-installer.servers')

  local servers = {
    "sumneko_lua",  -- 安装 brew install lua-language-server
    "jedi_language_server",  -- 安装 pip3 install -U jedi-language-server
    "pyright",  -- 安装 pip3 install pyright / npm install -g pyright
    "tailwindcss",  -- 安装 npm install -g @tailwindcss/language-server
  }

  lsp_installer.settings {
    ui = {
      icons = {
        server_installed = "﫟" ,
        server_pending = "",
        server_uninstalled = "✗",
      },
    },
  }

  -- Loop through the servers listed above.
  for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
      server:on_ready(function ()
        -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
        -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
        -- function to set up servers, to avoid doing setting up a server twice.
        local opts = {
          on_attach = attach,
          capabilities = capabilities,
          single_file_support = true,
          flags = {
            debounce_text_changes = 150,
          },
          settings = {},
        }
        server:setup(opts)
        vim.cmd [[ do User LspAttachBuffers ]]
      end)
      if not server:is_installed() then
        -- Queue the server to be installed.
        server:install()
      end
    end
  end
end

return M
