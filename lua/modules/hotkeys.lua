local colorscheme = require 'modules.colors'

local M = {}

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

local bind = function()
  -- Bulling
  map('<left>', '<cmd>echo "USE [h] TO MOVE YOU STUPID FUCK"<CR>')
  map('<right>', '<cmd>echo "USE [l] TO MOVE YOU STUPID FUCK"<CR>')
  map('<up>', '<cmd>echo "USE [k] TO MOVE YOU STUPID FUCK"<CR>')
  map('<down>', '<cmd>echo "USE [j] TO MOVE YOU STUPID FUCK"<CR>')
  map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')
  map('<leader>c', colorscheme.select, 'Select colorscheme')

  -- Terminal
  map('<Esc>', '<cmd>nohlsearch<CR>', '')
  map('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')

  -- Tabs and windows
  map('<C-w><C-r>', '<cmd>tab terminal<CR>', 'Create new te[r]minal tab')
  map('<C-w><C-c>', '<cmd>tabclose<CR>', 'Close tab')
  map('<C-w><C-t>', '<cmd>tabnew<CR>', 'Create new empty [t]ab')
  map('<C-w><C-w>', '<cmd>tabnext<CR>', '[n]ext tab')
  map('<C-w><C-q>', '<cmd>tabprev<CR>', 'Previous tab')
  map('<C-h>', '<C-w>h', 'Move focus to the left window')
  map('<C-l>', '<C-w>l', 'Move focus to the right window')
  map('<C-j>', '<C-w>j', 'Move focus to the lower window')
  map('<C-k>', '<C-w>k', 'Move focus to the upper window')
  map('<S-h>', '<C-w>H', 'Move window to left')
  map('<S-l>', '<C-w>L', 'Move window to right')
  map('<S-j>', '<C-w>J', 'Move window to bottom')
  map('<S-k>', '<C-w>K', 'Move window to top')
  map('<C-,>', '<C-w>>', 'Increase window width')
  map('<C-.>', '<C-w><', 'Decrease window width')
  map('<C-n>', '<C-w>+', 'Increase window height')
  map('<C-m>', '<C-w>-', 'Decrease window height')
  map('<C-e><C-j>', '<C-w>v', 'Split window verticaly')
  map('<C-e><C-k>', '<C-w>s', 'Split window horizontally')
  map('<C-e><C-t>', '<C-w>T', 'Move window into separate tab')
  map('<C-e><C-q>', '<C-w>q', 'Close window')
  map('<C-e><C-r>', '<cmd>terminal<CR>', 'Replace window with terminal')

  -- Neovide
  if vim.g.neovide then
    map('<C-=>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>', '', { 'n', 'v', 'i' })
    map('<C-->', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>', '', { 'n', 'v', 'i' })
    map('<C-0>', ':lua vim.g.neovide_scale_factor = 1<CR>', '', { 'n', 'v', 'i' })
  end

  -- Plugins

  -- Neotree
  map('\\', '<cmd>Neotree position=current<CR>')
  map('<C-\\>', '<cmd>Neotree source=buffers position=current<CR>')

  -- Telescope
  map('<leader>\\', '<cmd>Telescope colorscheme<CR>')
  map('gd', require('telescope.builtin').lsp_definitions, 'Goto [D]efinition')
  map('gr', require('telescope.builtin').lsp_references, 'Goto [R]eferences')
  map('gI', require('telescope.builtin').lsp_implementations, 'Goto [I]mplementation')
  map('<leader>lD', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  map('<leader>ld', require('telescope.builtin').lsp_document_symbols, '[D]ocument Symbols')
  map('<leader>ls', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')

  -- Lsp
  map('gD', vim.lsp.buf.declaration, 'Goto [D]eclaration')
  map('<leader>lr', vim.lsp.buf.rename, '[R]ename')
  map('<leader>lc', vim.lsp.buf.code_action, '[C]ode action', { 'n', 'x' })

  -- Neogit
  map('Z', function() vim.cmd 'Neogit' end, '')
end

M.init = function() bind() end

return M

-- local lsp = function()
--   map('<leader>l', '', '[L]sp')
--   map('<leader>lg', '', '[G]oto')
--   map('<leader>lgd', require('telescope.builtin').lsp_definitions, 'Goto [D]efinition')
--   map('<leader>lgr', require('telescope.builtin').lsp_references, 'Goto [R]eferences')
--   map('<leader>lgI', require('telescope.builtin').lsp_implementations, 'Goto [I]mplementation')
--   map('<leader>lgD', vim.lsp.buf.declaration, 'Goto [D]eclaration')
--   map('<leader>lD', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
--   map('<leader>ld', require('telescope.builtin').lsp_document_symbols, '[D]ocument Symbols')
--   map('<leader>ls', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')
--   map('<leader>lr', vim.lsp.buf.rename, '[R]ename')
--   map('<leader>lc', vim.lsp.buf.code_action, '[C]ode action', { 'n', 'x' })
-- end
