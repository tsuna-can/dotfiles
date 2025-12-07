return {
  {
    'akinsho/toggleterm.nvim',
    version = "*",
    direction = 'horizontal',
    config = function()
      require("toggleterm").setup {
        direction = 'horizontal',
        size = 20,
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
