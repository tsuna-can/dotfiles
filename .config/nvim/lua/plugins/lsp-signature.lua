return {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  config = function()
    require("lsp_signature").setup({
      bind = true,
      doc_lines = 2,
      floating_window = true,
      fix_pos = false,
      hint_enable = true,
      hint_prefix = "🔍 ",
      hint_scheme = "String",
      hi_parameter = "Search",
      max_height = 12,
      max_width = 80,
      handler_opts = {
        border = "rounded"
      },
      always_trigger = false,
      extra_trigger_chars = {"("},
      zindex = 50,
      padding = " ",
      transparency = nil,
      toggle_key = "<M-x>",
    })
  end,
}

