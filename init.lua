vim.g.mapleader = ' '

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
vim.g.have_nerd_font = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false

-- global clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 5

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- lock arrows
vim.keymap.set('n', '<left>', '<cmd>echo "h <- to move"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "l <- to move"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "k <- to move"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "j <- to move"<CR>')

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'typescript', 'javascript', 'vue', 'css', 'sass', 'scss', 'json' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.expandtab = true
  end,
})

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- Colors
  require 'plugins.colors.init',
  -- Base
  require 'plugins.base.telescope',
  require 'plugins.base.nvim-lspconfig',
  require 'plugins.base.conform',
  require 'plugins.base.lazydev',
  require 'plugins.base.nvim-cmp',
  require 'plugins.base.mini',
  require 'plugins.base.treesitter',
  require 'plugins.base.neo-tree',
  -- Quality of life
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  require 'plugins.qol.which-key',
  require 'plugins.qol.todo-comments',
  require 'plugins.qol.autopairs',
  require 'plugins.qol.gitsigns',
  require 'plugins.qol.dashboard',
  require 'plugins.qol.tip',
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- require('gruvbox').setup {
--   italic = {
--     strings = false,
--     comments = false,
--   },
-- }
-- vim.cmd.colorscheme 'gruvbox'

-- foreground option can be material, mix, or original
vim.g.gruvbox_material_foreground = 'material'
--background option can be hard, medium, soft
vim.g.gruvbox_material_background = 'medium'
vim.g.gruvbox_material_enable_italic = 0
vim.g.gruvbox_material_better_performance = 1

vim.cmd [[colorscheme gruvbox-material]]
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
