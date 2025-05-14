-- https://github.com/brenoprata10/nvim-highlight-colors
return {
  'brenoprata10/nvim-highlight-colors',
  config = function()
    require('cmp').setup {
      formatting = {
        format = require('nvim-highlight-colors').format,
      },
    }
  end,
}
