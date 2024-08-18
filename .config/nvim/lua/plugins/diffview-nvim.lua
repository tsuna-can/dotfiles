return {
  "sindrets/diffview.nvim",
  lazy = true,
  keys = {
    {
      "<leader>df",
      "<cmd>DiffviewFileHistory<cr>",
      desc = "File history"
    },
    {
      "<leader>dv",
      "<cmd>DiffviewOpen<cr>",
      desc = "Open diff view"
    },
    {
      "<leader>dc",
      "<cmd>DiffviewClose<cr>",
      desc = "Close diff view"
    },
  }
}

