local map = vim.keymap.set
local opts = { noremap = true, silent = true }
vim.g.mapleader = ' '

-- Select all
map("n", "<leader>a", "gg<S-v>G")

-- Delete without affecting the registers
map("n", "x", '"_x', opts)
map({ 'n', 'v' }, '<leader>d', '"_d', { noremap = true, silent = true })

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)

-- Oil
map('n', '<leader>e', ':Oil<CR>', opts)

-- Telescope
map('n', '<C-p>', ':Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>', { noremap = true })
map('n', '<C-g>', ':Telescope live_grep<CR>', { noremap = true })

-- Move to previous/next/first/last buffer
map('n', '[b', ':bprevious<CR>', opts)
map('n', ']b', ':bnext<CR>', opts)
map('n', '[B', ':bfirst<CR>', opts)
map('n', ']B', ':blast<CR>', opts)
-- Save and close all buffer
map('n', '<leader>q', '<cmd>wa | %bd<CR>', opts)
-- Move current buffer to the right pane
map('n', '<leader>>', ':wincmd L<CR>', opts)
-- Move current buffer to the left pane
map('n', '<leader><', ':wincmd H<CR>', opts)

-- Format
map(
  "n",
  "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<CR>",
  opts
)

-- Save
map('n', '<leader>w', ':w<CR>', opts)

-- DAP
map('n', '<leader>du', '<cmd>lua require"dapui".toggle()<CR>', { noremap = true, desc = "Toggle DAP UI" })
map('n', '<leader>dc', '<cmd>lua require"dap".continue()<CR>', { noremap = true, desc = "Continue Debugging" })
map('n', '<leader>db', '<cmd>lua require"dap".toggle_breakpoint()<CR>', { noremap = true, desc = "Toggle Breakpoint" })
map('n', '<leader>dt', '<cmd>lua require"dap".terminate()<CR>', { noremap = true, desc = "Terminate Debugging" })
map('n', '<leader>dr', '<cmd>lua require"dap".repl.open()<CR>', { noremap = true, desc = "Open REPL" })
