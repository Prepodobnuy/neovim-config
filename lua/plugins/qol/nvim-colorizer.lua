return {
  'catgoose/nvim-colorizer.lua',
  event = 'VeryLazy',
  config = function()
    require('colorizer').setup {
      filetypes = { '*' },
      RGB = true,
      RGBA = true,
      RRGGBB = true,
      RRGGBBAA = false,
      AARRGGBB = false,
      rgb_fn = true,
      hsl_fn = true,
      css = true,
      css_fn = true,
      names = false,
      mode = 'background',
    }
  end,
}
