local M = {}

M.title = 'Vscode'
M.set = function() vim.cmd.colorscheme 'vscode' end
M.package = {
  'Mofiqul/vscode.nvim',
  lazy = false,
}

return M
