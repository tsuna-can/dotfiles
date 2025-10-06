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

require('options')
require('keymaps')

-- Choose the plugins to load based on the environment
local is_raspberrypi = false
local is_vscode = vim.g.vscode == 1

-- Change the plugins to load based on the environment
local plugins = is_vscode and
    {
      { import = "plugins.im-select-nvim" }
    }
    or
    {
      -- load all plugins
      { import = "plugins" }
    }

require("lazy").setup({
  spec = plugins,
  install = { colorscheme = { "habamax" } },
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
