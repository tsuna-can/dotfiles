-- IME を英数に切り替える (im-select CLI が必要)
local im_default = "com.apple.keylayout.ABC"

vim.api.nvim_create_autocmd({ "VimEnter", "InsertEnter", "InsertLeave" }, {
  group = vim.api.nvim_create_augroup("im_select", { clear = true }),
  callback = function()
    vim.fn.system("im-select " .. im_default)
  end,
})

