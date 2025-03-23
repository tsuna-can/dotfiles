return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- DAP UI の設定
      dapui.setup()

      -- デバッグセッションの開始・終了時に UI を開閉
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- DAP 仮想テキストの設定
      require("nvim-dap-virtual-text").setup()

      -- launch.json に設定されたデバッグ構成を読み込む
      require('dap.ext.vscode').load_launchjs()
    end,
  },
}
