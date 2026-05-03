return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup({
      enhanced_diff_hl = true,
    })
  end,
  keys = {
    { "<leader>dvo", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>dvc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>dvh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    { "<leader>dvf", "<cmd>DiffviewToggleFiles<cr>", desc = "Toggle Files Panel" },
  },
}
