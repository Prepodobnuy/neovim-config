local M = {}

M.title = 'Tokyonight-day'
M.set = function() vim.cmd.colorscheme 'tokyonight-day' end
M.package = {
  'folke/tokyonight.nvim',
  lazy = false,
}

return M
