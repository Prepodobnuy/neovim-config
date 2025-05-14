local M = {}

M.package = {
  'everviolet/nvim',
  name = 'evergarden',
  lazy = false,
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

M.set = function()
  vim.cmd.colorscheme 'evergarden'
end

return M
