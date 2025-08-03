-- https://github.com/nvim-neo-tree/neo-tree.nvim
local icons = require 'shared.icons'

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  lazy = false,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim',
  },
  cmd = 'Neotree',
  opts = {
    filesystem = {
      open_files_do_not_replace_types = { 'terminal', 'trouble', 'qf' },
      default_component_configs = {
        icon = {
          folder_closed = icons.folder.closed,
          folder_open = icons.folder.open,
          folder_empty = icons.folder.empty,
          default = '*',
          highlight = 'NeoTreeFileIcon',
        },
      },
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<C-\\>'] = 'close_window',
        },
      },
    },
  },
}
