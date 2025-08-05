local icons = require 'shared.icons'

local diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = 'DiagnosticSignError', text = icons.diagnostic.error },
      { name = 'DiagnosticSignWarn', text = icons.diagnostic.warn },
      { name = 'DiagnosticSignHint', text = icons.diagnostic.hint },
      { name = 'DiagnosticSignInfo', text = icons.diagnostic.info },
    },
  },
  virtual_text = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = 'always',
    header = '',
    prefix = '',
  },
}

local M = {}

M.init = function()
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
  vim.opt.listchars = { tab = icons.tab, trail = icons.trail, nbsp = icons.nbsp }
  vim.opt.inccommand = 'split'
  vim.opt.cursorline = true
  vim.opt.scrolloff = 20
  vim.schedule(function() vim.opt.clipboard = 'unnamedplus' end)

  vim.diagnostic.config(diagnostic_config)
end

return M
