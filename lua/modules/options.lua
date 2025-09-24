local icons = require 'shared.icons'

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
vim.opt.showtabline = 2
vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.cmdheight = 0
vim.opt.listchars = { tab = icons.tab, trail = icons.trail, nbsp = icons.nbsp }
vim.opt.inccommand = 'split'
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.shortmess:append("sI")
vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

vim.diagnostic.config {
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = icons.diagnostic.error,
      [vim.diagnostic.severity.WARN] = icons.diagnostic.warn,
      [vim.diagnostic.severity.HINT] = icons.diagnostic.hint,
      [vim.diagnostic.severity.INFO] = icons.diagnostic.info,
    },
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,

  float = {
    focusable = false,
    style = 'minimal',
    border = 'single',
    source = 'always',
    header = '',
    prefix = '',
    suffix = '',
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

if vim.g.neovide then
  vim.o.guifont = 'UbuntuMono Nerd Font Mono:h14'

  vim.g.neovide_remember_window_size = false
  vim.g.neovide_remember_window_position = false

  vim.g.neovide_transparency = 1.0

  vim.g.neovide_cursor_vfx_mode = 'torpedo'
  vim.g.neovide_refresh_rate = 165
  vim.g.neovide_hide_mouse_when_typing = true
end
