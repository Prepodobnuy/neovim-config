local M = {}

M.title = 'Evergarden'
M.set = function() vim.cmd.colorscheme 'evergarden' end
M.package = {
  'everviolet/nvim',
  name = 'evergarden',
  lazy = true,
  opts = {
    theme = {
      variant = 'fall', -- 'winter'|'fall'|'spring'|'summer'
      accent = 'green',
    },
    editor = {
      transparent_background = false,
      sign = { color = 'none' },
      float = {
        color = 'mantle',
        invert_border = false,
      },
      completion = {
        color = 'surface0',
      },
    },
  },
}

return M
