return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()
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
        "solargraph"
      },
      automatic_installation = true,
    }
  end
}
