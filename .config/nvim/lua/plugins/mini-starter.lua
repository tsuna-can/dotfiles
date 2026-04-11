return {
  "echasnovski/mini.starter",
  version = "*",
  event = "VimEnter",
  config = function()
    local starter = require("mini.starter")

    local header = table.concat({
      "                                                     ",
      "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
      "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
      "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
      "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
      "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
      "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
      "                                                     ",
    }, "\n")

    local footer = function()
      local stats = require("lazy").stats()
      return string.format("⚡ %d plugins loaded in %.2fms", stats.count, stats.startuptime)
    end

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniStarterOpened",
      callback = function(ev)
        vim.keymap.set("n", "q", "<cmd>enew<CR>", { buffer = ev.buf, silent = true })
      end,
    })

    starter.setup({
      evaluate_single = true,
      header = header,
      footer = footer,
      items = {
        starter.sections.recent_files(7, false, false),
        starter.sections.builtin_actions(),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet("» "),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
