local colors = require 'modules.colors'

local base = {
  require 'plugins.base.telescope',
  require 'plugins.base.nvim-lspconfig',
  require 'plugins.base.conform',
  require 'plugins.base.nvim-cmp',
  require 'plugins.base.mini',
  require 'plugins.base.treesitter',
  require 'plugins.base.neo-tree',
  -- require 'plugins.base.lazydev',
}
local qol = {
  require 'plugins.qol.sleuth',
  require 'plugins.qol.todo-comments',
  require 'plugins.qol.gitsigns',
  require 'plugins.qol.which-key',
  -- require 'plugins.qol.nvim-highligth-colors',
  -- require 'plugins.qol.autopairs',
  -- require 'plugins.qol.ccc',
  -- require 'plugins.qol.nvim-colorizer',
  -- require 'plugins.qol.bufferline',
}
local useless = {
  require 'plugins.useless.presence-nvim',
  require 'plugins.useless.dashboard',
  -- require 'plugins.useless.nvim-scrollbar',
  -- require 'plugins.useless.noice-nvim',
  -- require 'plugins.useless.tip',
}

return {
  colors.packages,
  base,
  qol,
  useless,
}
