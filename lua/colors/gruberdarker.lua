local M = {}

M.package = {
  'blazkowolf/gruber-darker.nvim',
  opts = {
    bold = false,
    italic = {
      strings = false,
    },
  },
}

M.set = function()
  vim.cmd.colorscheme 'gruber-darker'
end

return M
