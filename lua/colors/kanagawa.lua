local M = {}

M.package = { 'rebelot/kanagawa.nvim', lazy = true }

M.set = function()
  vim.cmd.colorscheme 'kanagawa'
end

return M
