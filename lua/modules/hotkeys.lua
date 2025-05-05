local M = {}

local map = function(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

local neovide = function()
  if vim.g.neovide then
    map('<C-=>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>', '', { 'n', 'v', 'i' })
    map('<C-->', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>', '', { 'n', 'v', 'i' })
    map('<C-0>', ':lua vim.g.neovide_scale_factor = 1<CR>', '', { 'n', 'v', 'i' })
  end
end

local terminal = function()
  map('<Esc>', '<cmd>nohlsearch<CR>', '')
  map('<leader>q', vim.diagnostic.setloclist, 'Open diagnostic [Q]uickfix list')
  map('<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode', 't')
end

local lock_arrows = function()
  map('<left>', '<cmd>echo "[h] to move"<CR>')
  map('<right>', '<cmd>echo "[l] to move"<CR>')
  map('<up>', '<cmd>echo "[k] to move"<CR>')
  map('<down>', '<cmd>echo "[j] to move"<CR>')
end

local tabs = function()
  map('<C-w><C-r>', '<cmd>tab terminal<CR>', 'Create new te[r]minal tab')
  map('<C-w><C-c>', '<cmd>tabclose<CR>', 'Close tab')
  map('<C-w><C-t>', '<cmd>tabnew<CR>', 'Create new empty [t]ab')
  map('<C-w><C-w>', '<cmd>tabnext<CR>', '[n]ext tab')
  map('<C-w><C-q>', '<cmd>tabprev<CR>', 'Previous tab')
end

local window_movement = function()
  map('<C-h>', '<C-w><C-h>', 'Move focus to the left window')
  map('<C-l>', '<C-w><C-l>', 'Move focus to the right window')
  map('<C-j>', '<C-w><C-j>', 'Move focus to the lower window')
  map('<C-k>', '<C-w><C-k>', 'Move focus to the upper window')
end

local window_managment = function()
  map('<C-e><C-j>', '<C-w><C-v>', 'Split window verticaly')
  map('<C-e><C-k>', '<C-w><C-s>', 'Split window horizontally')
  map('<C-e><C-q>', '<cmd>q<CR>', 'Close buffer')
  map('<C-e><C-w>', '<cmd>w<CR>', 'Write buffer')
end

local lsp = function()
  -- map('<leader>l', '', '[L]sp')
  -- map('<leader>lg', '', '[G]oto')
  -- map('<leader>lgd', require('telescope.builtin').lsp_definitions, 'Goto [D]efinition')
  -- map('<leader>lgr', require('telescope.builtin').lsp_references, 'Goto [R]eferences')
  -- map('<leader>lgI', require('telescope.builtin').lsp_implementations, 'Goto [I]mplementation')
  -- map('<leader>lgD', vim.lsp.buf.declaration, 'Goto [D]eclaration')
  -- map('<leader>lD', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
  -- map('<leader>ld', require('telescope.builtin').lsp_document_symbols, '[D]ocument Symbols')
  -- map('<leader>ls', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace [S]ymbols')
  -- map('<leader>lr', vim.lsp.buf.rename, '[R]ename')
  -- map('<leader>lc', vim.lsp.buf.code_action, '[C]ode action', { 'n', 'x' })
end

M.init = function()
  neovide()
  tabs()
  lock_arrows()
  terminal()
  window_movement()
  lsp()
  window_managment()
end

return M
