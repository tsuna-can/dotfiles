require('options')
require('keymaps')

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  performance = {
    rtp = {
      disabled_plugins = {
        "netrw",
        "netrwPlugin",
        "netrwSettings",
        "netrwFileHandlers",
      },
    },
  },
})

require('lualine').setup()
require("toggleterm").setup {
  direction = 'float',
  open_mapping = [[<c-\>]],
}
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup {}
require("lspconfig").jdtls.setup {
  root_dir = require('lspconfig').util.root_pattern('.git', 'pom.xml', 'build.gradle'),
  settings = {
    java = {
      configuration = {
        format = {
          enabled = true,
          settings = {
            url = 'https://github.com/google/google-java-format',
          },
        },
      },
    },
  },
}

