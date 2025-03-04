return {
  "williamboman/mason.nvim",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup {
      ensure_installed = {
        "lua_ls",
        "bashls",
        'dockerls',
        "jsonls",
        'taplo',
        'yamlls',
        'gopls'
      }
    }
    require('mason-lspconfig').setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {}
      end,
    }
  end
}

