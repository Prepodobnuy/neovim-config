-- https://github.com/nvim-neo-tree/neo-tree.nvim
-- https://github.com/nvim-lua/plenary.nvim
-- https://github.com/nvim-tree/nvim-web-devicons
-- https://github.com/MunifTanjim/nui.nvim

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
  opts = function(_, opts)
    local function on_move(data) Snacks.rename.on_rename_file(data.source, data.destination) end
    local events = require 'neo-tree.events'
    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })

    opts.filesystem = {
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
    }
  end,
}
