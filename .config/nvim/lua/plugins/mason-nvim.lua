return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  config = function()
    require("mason").setup()

    local lsp_defaults = require("config.lsp.default")

    -- 全サーバー共通設定
    vim.lsp.config('*', {
      on_attach = lsp_defaults.on_attach,
      capabilities = lsp_defaults.capabilities,
    })

    require("mason-lspconfig").setup({
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
        "ts_ls",
        "eslint",
        "kotlin_language_server"
      },
      automatic_enable = true,
    })
  end
}
