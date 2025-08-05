local M = {}

M.title = 'Kanagawa'
M.set = function() vim.cmd.colorscheme 'kanagawa' end
M.package = { 'rebelot/kanagawa.nvim', lazy = true }

return M
