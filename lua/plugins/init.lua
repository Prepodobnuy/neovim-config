-- stylua: ignore start
return {
  require 'plugins.base.conform',              -- Formatter
  require 'plugins.base.nvim-cmp',             -- Hints
  require 'plugins.base.snacks',               -- Usefull
  require 'plugins.base.telescope',
  require 'plugins.base.treesitter',
  -- require 'plugins.base.nvim-dap',          -- Dap ui

  require 'plugins.lsp.lazydev',               -- Complete luals configuration
  require 'plugins.lsp.rustace',               -- Complete rust-analuzer configuration

  require 'plugins.interactive.mason',         -- Tooling package manager
  require 'plugins.interactive.neogit',        -- Awesome git interface (magit like)
  require 'plugins.interactive.oil',           -- File explorer
  require 'plugins.interactive.window-picker', -- Best nvim plugin
  require 'plugins.interactive.scratch',       -- Scratch buffer
  require 'plugins.interactive.macro',         -- Save/Load macros
  require 'plugins.interactive.colormanager',  -- Colorscheme manager (my own plugin)

  require 'plugins.informative.gitsigns',      -- Displays git stuff
  require 'plugins.informative.todo-comments', -- Highlights  TODO:
  require 'plugins.informative.which-key',     -- Useful plugin that displays keybinds

  require 'plugins.ui.noice',                  -- Command line
  require 'plugins.ui.lualine',                -- Statusline + Tabline

  require 'plugins.useless.highlight-colors', -- Highlight colors, rgb(155, 155, 155) (laggy)
}
-- stylua: ignore end
