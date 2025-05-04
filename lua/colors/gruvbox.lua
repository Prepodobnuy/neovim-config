local M = {}

M.package = {
  'ellisonleao/gruvbox.nvim',
  config = function()
    ---@diagnostic disable-next-line: missing-fields
  end,
  lazy = true,
}

M.set = function()
  require('gruvbox').setup {
    terminal_colors = true,
    bold = false,
    invert_selection = false,
    inverse = true,
    italic = {
      strings = false,
      emphasis = false,
      comments = false,
      operators = false,
      folds = false,
    },
    contrast = 'soft',
  }
  vim.cmd.colorscheme 'gruvbox'
end

return M
