local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

-- Save
map('n', '<leader>w', ':w<CR>', opts)

-- Select all
map("n", "<leader>a", "gg<S-v>G")

-- Delete without affecting the registers
map("n", "x", '"_x', opts)
map({ 'n', 'v' }, '<leader>d', '"_d', { noremap = true, silent = true })

-- Move current buffer to the right pane
map('n', '<leader>>', ':wincmd L<CR>', opts)
-- Move current buffer to the left pane
map('n', '<leader><', ':wincmd H<CR>', opts)

-- ターミナルモード内でウィンドウ移動
map('t', '<C-w>h', [[<C-\><C-n><C-w>h]], { noremap = true, silent = true, desc = "Move to left window" })
map('t', '<C-w>j', [[<C-\><C-n><C-w>j]], { noremap = true, silent = true, desc = "Move to below window" })
map('t', '<C-w>k', [[<C-\><C-n><C-w>k]], { noremap = true, silent = true, desc = "Move to above window" })
map('t', '<C-w>l', [[<C-\><C-n><C-w>l]], { noremap = true, silent = true, desc = "Move to right window" })

-- Neo-tree
map('n', '<leader>e', ':Neotree toggle<CR>', opts)

-- Telescope
map('n', '<C-p>', ':Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>', { noremap = true })
map('n', '<C-g>', ':Telescope live_grep<CR>', { noremap = true })

-- Move to previous/next/first/last buffer (barbar order)
map('n', '[b', '<Cmd>BufferPrevious<CR>', opts)
map('n', ']b', '<Cmd>BufferNext<CR>', opts)
map('n', '[B', '<Cmd>BufferFirst<CR>', opts)
map('n', ']B', '<Cmd>BufferLast<CR>', opts)

-- Lazygit
map('n', '<leader>lg', function()
  local Terminal = require('toggleterm.terminal').Terminal
  local lazygit = Terminal:new({
    cmd = 'lazygit',
    direction = 'horizontal',
    size = 20,
    hidden = true,
  })
  lazygit:toggle()
end, { noremap = true, silent = true, desc = "Toggle Lazygit" })

