return {
  "lambdalisue/gin.vim",
  dependencies = {
    "vim-denops/denops.vim",
  },
  cmd = {
    "Gin",
    "GinBuffer",
    "GinBranch",
    "GinLog",
    "GinStatus",
    "GinDiff",
    "GinBlame",
  },
  keys = {
    { "<leader>gl", "<cmd>Gin log<cr>", desc = "Git Log" },
    { "<leader>gb", "<cmd>Gin branch<cr>", desc = "Git Branch" },
    { "<leader>gd", "<cmd>Gin diff<cr>", desc = "Git Diff" },
    { "<leader>gB", "<cmd>GinBlame %<cr>", desc = "Git Blame" },
  },
}
