local opt = vim.opt

opt.number = true
opt.relativenumber = false
opt.ignorecase = true
opt.hlsearch = true
opt.scrolloff = 30
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.cursorcolumn = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.wrap = true
opt.laststatus = 3
opt.showmatch = true

-- Disable cursorcolumn for markdown files
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "md" },
  callback = function()
    vim.opt_local.cursorcolumn = false
  end,
})
