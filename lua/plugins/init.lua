-- stylua: ignore start
return {
  require 'plugins.base.conform',  -- Formatter
  require 'plugins.base.nvim-cmp', -- Hints
  -- require 'plugins.base.nvim-dap', -- Dap ui
  require 'plugins.base.snacks',   -- Usefull
  require 'plugins.base.telescope',
  require 'plugins.base.treesitter',

  require 'plugins.lsp.lazydev', -- Complete luals configuration
  require 'plugins.lsp.rustace', -- Complete rust-analuzer configuration

  require 'plugins.interactive.mason',         -- Tooling package manager
  require 'plugins.interactive.neogit',        -- Awesome git interface (magit like)
  require 'plugins.interactive.oil',           -- File explorer
  require 'plugins.interactive.window-picker', -- Best nvim plugin
  require 'plugins.interactive.scratch',       -- Scratch buffer
  require 'plugins.interactive.macro',         -- Save/Load macros
  require 'plugins.interactive.colormanager',  -- Colorscheme manager (my own plugin)

  require 'plugins.informative.which-key',     -- Useful plugin that displays keybinds
  require 'plugins.informative.gitsigns',      -- Displays git stuff
  require 'plugins.informative.todo-comments', -- Highlights  TODO:

  require 'plugins.qol.ts-autotag',   -- Colorscheme manager (my own plugin)
  require 'plugins.qol.zen-mode',
  -- require 'plugins.qol.confirm-quit', -- Usefull while using neovide

  require 'plugins.ui.noice',    -- Command line
  -- require 'plugins.ui.tabby',   -- Tabline
  -- require 'plugins.ui.tabline',  -- Tabline
  require 'plugins.ui.lualine',  -- Statusline

  require 'plugins.useless.highlight-colors', -- Highlight colors, rgb(155, 155, 155) (laggy)
  -- require 'plugins.useless.autopairs',     -- Autopair plugin (annoying)
  -- require 'plugins.useless.presence-nvim', -- Discord rich presence (actually useless)
}
-- stylua: ignore end
