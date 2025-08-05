local M = {}

M.title = 'Tokyonight'
M.set = function() vim.cmd.colorscheme 'tokyonight' end
M.package = {
  'folke/tokyonight.nvim',
  lazy = false,
}

return M
