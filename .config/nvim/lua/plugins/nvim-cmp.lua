return {
  "hrsh7th/nvim-cmp",
  event = 'VimEnter',
  dependencies = {
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-emoji" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    { "onsails/lspkind.nvim" },
  },
  config = function()
    local cmp = require('cmp')
    local lspkind = require('lspkind')

    cmp.setup({
      snippet = {
        expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        ['<Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif vim.fn["vsnip#available"](1) == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
          else
            fallback()
          end
        end, { 'i', 's' }),

        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif vim.fn["vsnip#jumpable"](-1) == 1 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
          else
            fallback()
          end
        end, { 'i', 's' }),
      }),

      sources = cmp.config.sources({
        { name = 'nvim_lsp', priority = 1000 },
        { name = 'vsnip', priority = 750 },
        { name = 'buffer', priority = 500 },
        { name = 'emoji', priority = 250 },
      }),

      formatting = {
        format = lspkind.cmp_format({
          mode = 'symbol_text',
          maxwidth = 50,
          ellipsis_char = '...',
          before = function(entry, vim_item)
            return vim_item
          end
        })
      },

      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },

      experimental = {
        ghost_text = true,
      },
    })
  end,
}

