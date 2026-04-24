return {
  "delphinus/md-render.nvim",
  version = "*",
  ft = "markdown",
  dependencies = {
    { "nvim-tree/nvim-web-devicons", version = "*" },
    { "delphinus/budoux.lua", version = "*" },
  },
  keys = {
    { "<leader>mp", function() require("md-render").preview.show({ max_width = 120 }) end, desc = "Markdown preview (float)" },
    { "<leader>mt", function() require("md-render").preview.show_tab({ max_width = 120 }) end, desc = "Markdown preview (tab)" },
  },
}
