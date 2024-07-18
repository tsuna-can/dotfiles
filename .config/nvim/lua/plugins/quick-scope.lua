return {
  "unblevable/quick-scope",
  init = function()
    vim.g.qs_highlight_on_keys = { 'f', 'F', 't', 'T' }
    vim.g.qs_accepted_chars = {'a','b','c','d', 'e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u', 'v','w','x','y','z'}
  end,
  keys = { 'f', 'F', 't', 'T' },
  config = function()
    vim.api.nvim_set_hl(0, "QuickScopePrimary", {
      bold = true,
      bg = "#ffffff",
      fg = "#000000",
    })
    vim.api.nvim_set_hl(0, "QuickScopeSecondary", {
      bold = true,
      bg = "#f28579",
      fg = "#000000",
    })
  end
}

