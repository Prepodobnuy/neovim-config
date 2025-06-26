local M = {}

M.package = {
  'folke/tokyonight.nvim',
  lazy = false,
}

M.dark = function()
  vim.cmd.colorscheme 'tokyonight'
end

M.light = function()
  vim.cmd.colorscheme 'tokyonight-day'
end

return M
