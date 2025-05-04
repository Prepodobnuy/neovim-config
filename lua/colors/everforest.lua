local M = {}

M.package = {
  'neanias/everforest-nvim',
  lazy = false,
  config = function()
    require('everforest').setup {}
  end,
}

M.set = function()
  vim.cmd.colorscheme 'everforest'
end

return M
