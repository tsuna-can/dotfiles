return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        style = {
          { fg = "#806d9c" },
          { fg = "#c21f30" },
        },
        use_treesitter = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "",
        },
        textobject = "",
        max_file_size = 1024 * 1024,
        error_sign = true,
        duration = 0,
        delay = 0,
      },
      indent = {
        enable = true,
        use_treesitter = false,
        chars = {
          "│",
        },
        style = {
          { fg = "#3b4252" },
        },
      },
      line_num = {
        enable = false,
      },
      blank = {
        enable = false,
      },
    })
  end,
}
