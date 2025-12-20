return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    local lsp_defaults = require("config.lsp.default")

    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "bashls",
        "dockerls",
        "jsonls",
        "taplo",
        "yamlls",
        "gopls",
        "clangd",
        "solargraph",
        "ts_ls"
      },
      automatic_installation = true,
      handlers = {
        function(server_name)
          require("lspconfig")[server_name].setup {
            on_attach = lsp_defaults.on_attach,
            capabilities = lsp_defaults.capabilities,
          }
        end,
      },
    }
  end
}
