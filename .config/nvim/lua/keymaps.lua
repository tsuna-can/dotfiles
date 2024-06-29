local map = vim.keymap.set
vim.g.mapleader = ' '

map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>b', ':NvimTreeToggle<CR>', {silent=true})
map('n', '<leader>e', ':NvimTreeFocus<CR>', {silent=true})
map('n', '<C-p>',  ':Telescope find_files find_command=rg,--files,--hidden,--glob,!*.git <CR>', {noremap=true})
map('n', '<C-g>',  ':Telescope live_grep<CR>', {noremap=true})

