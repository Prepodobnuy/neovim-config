return {
  'catgoose/nvim-colorizer.lua',
  event = 'VimEnter',
  config = function()
    require('colorizer').setup {
      filetypes = { '*' },
      RGB = true,
      RGBA = true,
      RRGGBB = true,
      RRGGBBAA = true,
      AARRGGBB = true,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
    }
  end,
}
