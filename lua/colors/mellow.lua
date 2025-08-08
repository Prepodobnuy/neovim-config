local M = {}

M.title = 'Mellow'
M.set = function() vim.cmd.colorscheme 'mellow' end
M.package = {
  'mellow-theme/mellow.nvim',
  lazy = true,
}

return M
