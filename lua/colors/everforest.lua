local M = {}

M.title = 'Everforest'
M.set = function() vim.cmd.colorscheme 'everforest' end
M.package = {
  'neanias/everforest-nvim',
  lazy = true,
  config = function() require('everforest').setup {} end,
}

return M
