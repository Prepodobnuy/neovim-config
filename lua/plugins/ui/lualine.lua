-- https://github.com/nvim-lualine/lualine.nvim

local sep = require('shared.icons').lualine.sep

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = sep.component_left, right = sep.component_right },
        section_separators = { left = sep.section_left, right = sep.section_right },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'filename' },
        lualine_c = { 'branch', 'diff', 'diagnostics' },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = {
          {
            'tabs',
            mode = 1,
            max_length = 40,
            use_mode_colors = true,
            tabs_color = {
              inactive = 'lualine_a_inactive',
            },
          },
        },
        lualine_x = { 'datetime' },
        lualine_z = {
          {
            'hostname',
          },
        },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = { 'oil', 'mason', 'lazy' },
    }
  end,
}
