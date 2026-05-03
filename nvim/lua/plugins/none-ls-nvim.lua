return {
  "nvimtools/none-ls.nvim",
  enabled = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      on_attach = require("config.lsp.default").on_attach,
      debug = false,
      sources = {
        -- lua
        formatting.stylua,

        -- css/sass/scss/vue etc
        diagnostics.stylelint.with({
          extra_filetypes = { "vue" },
        }),
        formatting.stylelint.with({
          extra_filetypes = { "vue" },
        }),

        -- html, json, markdown, etc
        formatting.prettierd.with({
          filetypes = {
            "vue",
            "javascriptreact",
            "typescriptreact",
            "html",
            "json",
            "markdown",
            "toml",
          },
        }),

        -- sh
        formatting.shfmt,

        -- Ruby
        formatting.rubocop,
        diagnostics.rubocop,

        -- other
        -- diagnostics.write_good,
      },
    })
  end,
}

