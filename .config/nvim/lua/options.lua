local opt = vim.opt

opt.number = true
opt.relativenumber = false
opt.ignorecase = true
opt.hlsearch = true
opt.scrolloff = 30
opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.wrap = true
opt.laststatus = 3
opt.showmatch = true

-- Auto open neo-tree when opening a directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function(data)
    local directory = vim.fn.isdirectory(data.file) == 1
    if directory then
      vim.cmd.cd(data.file)
      require("neo-tree.command").execute({ toggle = false })
    end
  end,
})
