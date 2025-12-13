return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    direction = 'vertical',
    config = function()
      require("toggleterm").setup {
        direction = 'vertical',
        size = 80,
        open_mapping = [[<c-\>]],
        persist_mode = false,
        winbar = {
          enabled = true,
          name_formatter = function(term)
            return string.format("Terminal #%d", term.id)
          end
        },
      }
    end,
  }
}
