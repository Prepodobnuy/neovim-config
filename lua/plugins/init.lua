-- stylua: ignore start

require 'plugins.deps.web-devicons'
require 'plugins.deps.plenary'
require 'plugins.deps.lspconfig'
require 'plugins.deps.diffview'
require 'plugins.deps.nui'
require 'plugins.deps.nvim-notify'

require 'plugins.base.conform'              -- Formatter
require 'plugins.base.mason'                -- Tooling package manager
require 'plugins.base.nvim-cmp'             -- Hints
require 'plugins.base.telescope'            -- Fuzzy finder
require 'plugins.base.treesitter'           -- Color highlighting & code navigation

require 'plugins.lsp.lazydev'               -- Complete luals configuration
require 'plugins.lsp.rustace'               -- Complete rust-analuzer configuration

require 'plugins.interactive.neogit'        -- Awesome git interface (magit like)
require 'plugins.interactive.oil'           -- File explorer
require 'plugins.interactive.window-picker' -- Best nvim plugin
require 'plugins.interactive.scratch'       -- Scratch buffer
require 'plugins.interactive.macro'         -- Save/Load macros
require 'plugins.interactive.colormanager'  -- Colorscheme manager

require 'plugins.informative.gitsigns'      -- Displays git stuff
require 'plugins.informative.which-key'     -- Useful plugin that displays keybinds
require 'plugins.informative.todo-comments' -- Highlights  TODO:

require 'plugins.ui.lualine'                -- Statusline + Tabline
require 'plugins.ui.noice-nvim'             -- idk how it works and what it does

require 'plugins.qol.highlight-colors'      -- Highlight colors, rgb(155, 155, 155)
require 'plugins.qol.ts-autotag'            -- Tags close Before: '<div' | Input: '>' | After: '<div></div>'

-- stylua: ignore end
