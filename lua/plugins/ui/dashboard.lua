local icons = require 'shared.icons'
local ascii = require 'shared.ascii'
local icon = icons.dashboard_mark
local key_fmt = '[%s]'

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'doom',
      config = {
        header = ascii.random(),
        center = {
          {
            icon_hl = 'DashboardHeader',
            desc_hl = 'group',
            key_hl = 'group',
            icon = icon,
            desc = 'Terminal                    ',
            key = 't',
            keymap = '<C-e><C-r> ',
            key_format = key_fmt,
            action = 'terminal',
          },
          {
            icon_hl = 'DashboardHeader',
            desc_hl = 'group',
            key_hl = 'group',
            icon = icon,
            desc = 'File tree',
            key = 'f',
            keymap = '<\\> ',
            key_format = key_fmt,
            action = 'Neotree float',
          },
          {
            icon_hl = 'DashboardHeader',
            desc_hl = 'group',
            key_hl = 'group',
            icon = icon,
            desc = 'Lazy',
            key = 'z',
            keymap = '<Space><z> ',
            key_format = key_fmt,
            action = 'Lazy',
          },
          {
            icon_hl = 'DashboardHeader',
            desc_hl = 'group',
            key_hl = 'group',
            icon = icon,
            desc = 'Colorscheme',
            key = 'c',
            keymap = '<Space><c> ',
            key_format = key_fmt,
            action = 'require("modules.colors").select()',
          },
          {
            icon_hl = 'DashboardHeader',
            desc_hl = 'group',
            key_hl = 'group',
            icon = icon,
            desc = 'Exit',
            key = 'q',
            key_format = key_fmt,
            action = 'q',
          },
        },
        footer = { '' },
        vertical_center = false,
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
