-- https://github.com/kdheepak/tabline.nvim

local sep = require('shared.icons').lualine.sep

return {
  'kdheepak/tabline.nvim',
  config = function()
    require('tabline').setup {
      enable = true,
      options = {
        section_separators = { sep.section_left, sep.section_right },
        component_separators = { sep.component_left, sep.component_right },
        max_bufferline_percent = 66,
        show_tabs_always = true,
        show_devicons = true,
        show_bufnr = false,
        show_filename_only = false,
        modified_icon = '+ ',
        modified_italic = false,
        show_tabs_only = true,
      },
    }
    vim.cmd [[
      set guioptions-=e
      set sessionoptions+=tabpages,globals
    ]]
  end,
  dependencies = {
    'kyazdani42/nvim-web-devicons',
  },
}
