local M = {}

M.title = 'Gruber-darker'
M.set = function() vim.cmd.colorscheme 'gruber-darker' end
M.package = {
  'blazkowolf/gruber-darker.nvim',
  opts = {
    bold = false,
    italic = {
      strings = false,
    },
  },
}

return M
