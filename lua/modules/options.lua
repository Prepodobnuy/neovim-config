local icons = require 'shared.icons'

vim.g.window_picker_hint = 'floating-big-letter'
vim.g.window_picker_force_close = true

vim.g.mapleader = ' '
vim.g.loaded_netrwPlugin = 0
vim.g.loaded_netrw = 0
vim.g.have_nerd_font = true
vim.opt.winborder = 'none'
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.breakindent = true
vim.opt.modifiable = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = 'yes'
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.swapfile = false
vim.opt.showtabline = 1
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = icons.tab, trail = icons.trail, nbsp = icons.nbsp }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 19
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

vim.diagnostic.config {
  severity_sort = true,
  underline = false,
  signs = {
    values = {
      { name = 'DiagnosticSignError', text = icons.diagnostic.error },
      { name = 'DiagnosticSignWarn',  text = icons.diagnostic.warn },
      { name = 'DiagnosticSignInfo',  text = icons.diagnostic.info },
      { name = 'DiagnosticSignHint',  text = icons.diagnostic.hint },
    },
    text = {
      [1] = icons.diagnostic.error,
      [2] = icons.diagnostic.warn,
      [3] = icons.diagnostic.info,
      [4] = icons.diagnostic.hint,
    },
  },
  virtual_text = {
    current_line = true,
    source = false,
    prefix = '',
    suffix = '',
    spacing = 0,
    virt_text_pos = 'eol',
    hl_mode = 'blend',
    format = function(diagnostic) return '"' .. diagnostic.message .. '"' end,
  },
}
