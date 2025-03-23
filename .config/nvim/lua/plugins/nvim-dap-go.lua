local config = function()
  require('dap-go').setup {
    dap_configurations = {
      {
        type = "go",
        name = "Debug (Build Flags)",
        request = "launch",
        program = "${file}",
        buildFlags = require("dap-go").get_build_flags,
      },
    },
  }
end

return {
  "leoluz/nvim-dap-go",
  event = { "BufEnter *.go" },
  config = config,
}
