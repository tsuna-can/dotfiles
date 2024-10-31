local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

-- Select all
map("n", "<C-a>", "gg<S-v>G")

-- Delete without affecting the registers
map("n", "x", '"_x')

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- NvimTree
map('n', '<leader>b', ':NvimTreeToggle<CR>', { silent = true })
map('n', '<leader>e', ':NvimTreeFocus<CR>', { silent = true })

-- Telescope
map('n', '<C-p>', ':Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>', { noremap = true })
map('n', '<C-g>', ':Telescope live_grep<CR>', { noremap = true })

-- Move to previous/next buffer
map('n', '<leader>,', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<leader>.', '<Cmd>BufferNext<CR>', opts)
-- -- Re-order to previous/next buffer
-- map('n', '<leader><', '<Cmd>BufferMovePrevious<CR>', opts)
-- map('n', '<leader>>', '<Cmd>BufferMoveNext<CR>', opts)
-- Goto buffer in position...
map('n', '<leader>1', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<leader>2', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<leader>3', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<leader>4', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<leader>5', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<leader>6', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<leader>7', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<leader>8', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<leader>9', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<leader>0', '<Cmd>BufferLast<CR>', opts)
-- Pin/unpin buffer
map('n', '<leader>p', '<Cmd>BufferPin<CR>', opts)
-- Close buffer
map('n', '<leader>c', '<Cmd>BufferClose<CR>', opts)

-- Format
map(
  "n",
  "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
  opts
)

