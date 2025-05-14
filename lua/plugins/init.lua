local colors = require 'modules.colors'

return {
  colors.packages,
  require 'plugins.base',
  require 'plugins.lsp',
  require 'plugins.qol',
  require 'plugins.ui',
  -- require 'plugins.useless',
}
