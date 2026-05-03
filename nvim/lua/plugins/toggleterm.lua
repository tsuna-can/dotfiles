return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = "VeryLazy",
    config = function()
      require("toggleterm").setup {
        direction = 'vertical',
        size = 80,
        persist_mode = false,
        winbar = {
          enabled = true,
          name_formatter = function(term)
            return string.format("Terminal #%d", term.id)
          end
        },
      }

      local map = vim.keymap.set
      map({ 'n', 't' }, [[<C-\>]], function()
        require('toggleterm').toggle(1, 80, nil, 'vertical')
      end, { noremap = true, silent = true, desc = "Toggle terminal at width 80" })
      map({ 'n', 't' }, [[<C-f>]], function()
        require('toggleterm').toggle(1, vim.o.columns, nil, 'vertical')
      end, { noremap = true, silent = true, desc = "Toggle terminal at max width" })
    end,
  }
}
