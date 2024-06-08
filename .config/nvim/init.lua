vim.g.mapleader = ' '
vim.opt.number = true

vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.api.nvim_set_keymap('n', '<leader>b', ':NvimTreeToggle<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<leader>e', ':NvimTreeFocus<CR>', {silent=true})
vim.api.nvim_set_keymap('n', '<C-p>',  ':Telescope find_files<CR>', {noremap=true})
vim.api.nvim_set_keymap('n', '<C-g>',  ':Telescope live_grep<CR>', {noremap=true})

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
require("toggleterm").setup{
  direction = 'float',
  open_mapping = [[<c-\>]],
}
require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").lua_ls.setup {}

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit",
	direction = "float",
	hidden = true
})

function _lazygit_toggle()
	lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "lg", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

