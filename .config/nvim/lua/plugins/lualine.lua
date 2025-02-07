local function git_repo_name()
  -- Get the top-level directory of the current git repository
  local handle = io.popen('git rev-parse --show-toplevel 2> /dev/null')
  if handle == nil then return '' end
  local result = handle:read("*a")
  handle:close()

  -- Extract the last part of the path
  local repo_name = result:match("^.+/(.+)\n$")
  return repo_name or ''
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = 'VeryLazy',
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { git_repo_name },
      lualine_c = { 'branch', 'filename', 'diagnostics' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location' }
    }
  },
}

