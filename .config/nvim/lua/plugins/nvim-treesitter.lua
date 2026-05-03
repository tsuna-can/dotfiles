-- 'lua' を除外: nvim-treesitter の lua.so は Neovim 0.12.1 の highlights.scm
-- と互換性がない（新文法では operator フィールドが存在しない）。
-- Neovim 組み込みの lua.so を使わせることで解消する。
local parsers_maintained = {
  'typescript',
  'scss',
  'css',
  'bash',
  'json',
  'jsonc',
  'javascript',
  'markdown',
  'markdown_inline',
  'tsx',
  'html',
  'kotlin'
}

local M = {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").setup({
      ensure_installed = parsers_maintained,
    })
    -- lua を除外: nvim-treesitter の lua.so は Neovim 0.12.1 の highlights.scm
    -- と互換性がない。Neovim 組み込みの lua.so を使わせることで解消する。
    vim.api.nvim_create_autocmd('FileType', {
      group = vim.api.nvim_create_augroup('treesitter_highlight', { clear = true }),
      pattern = '*',
      callback = function(args)
        if args.match ~= 'lua' then
          pcall(vim.treesitter.start)
        end
      end,
    })
  end,
}

return { M }

