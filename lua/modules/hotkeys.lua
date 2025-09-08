local telescope = require 'telescope.builtin'
local lsp = vim.lsp

-- stylua: ignore start

local keymaps = {
  -- Macros
  { '<leader>ml', require('nvim-macros').select_and_yank_macro, 'Macros: [L]oad macro' },
  { '<leader>ms', require('nvim-macros').save_macro,            'Macros: [S]ave macro' },
  { '<leader>md', require('nvim-macros').delete_macro,          'Macros: [D]elete macro' },

  -- Bulling
  { '<left>',  '<cmd>echo "USE [h] TO MOVE YOU STUPID FUCK"<CR>', '' },
  { '<right>', '<cmd>echo "USE [l] TO MOVE YOU STUPID FUCK"<CR>', '' },
  { '<up>',    '<cmd>echo "USE [k] TO MOVE YOU STUPID FUCK"<CR>', '' },
  { '<down>',  '<cmd>echo "USE [j] TO MOVE YOU STUPID FUCK"<CR>', '' },
  { '<leader>re', '"hy:%s/<C-r>h/<C-r>h/gc<left><left><left>', 'Search/Replace: [R]eplace selected text', 'v' },

  -- Diagnostic
  { '<leader>dq', vim.diagnostic.setloclist,                         'Diagnostic: Open [Q]uickfix list' },
  { '<leader>dj', function() vim.diagnostic.jump { count = 1 } end,  'Diagnostic: [J]ump to next' },
  { '<leader>dk', function() vim.diagnostic.jump { count = -1 } end, 'Diagnostic: [K]ump to prev' },

  -- Window management
  { '<C-f>', require('modules.winst').focus,         'Windows: [F]ocus' },
  { '<C-s>', require('modules.winst').swap,          'Windows: [S]wap' },
  { '<S-s>', require('modules.winst').swap_endless,  'Windows: Endless [S]wap' },
  { '<C-c>', require('modules.winst').close,         'Windows: [C]lose' },
  { '<S-c>', require('modules.winst').close_endless, 'Windows: Endless [C]lose' },

  -- Terminal
  { '<Esc>', '<cmd>nohlsearch<CR>', '' },
  { '<Esc><Esc>', '<C-\\><C-n>', 'Terminal: Exit insert mode', 't' },

  -- Tabs and windows
  { '<C-w><C-r>', '<cmd>tab terminal<CR>', 'Create te[R]minal tab' },
  { '<C-w><C-c>', '<cmd>tabclose<CR>',     '[C]lose' },
  { '<C-w><C-t>', '<cmd>tabnew<CR>',       'Create new [T]ab' },
  { '<C-w><C-w>', '<cmd>tabnext<CR>',      '[N]ext' },
  { '<C-w><C-q>', '<cmd>tabprev<CR>',      '[P]revious' },
  { '<C-,>', '<C-w>>',                     'Increase width' },
  { '<C-.>', '<C-w><',                     'Decrease width' },
  { '<C-n>', '<C-w>+',                     'Increase height' },
  { '<C-m>', '<C-w>-',                     'Decrease height' },
  { '<C-e><C-j>', '<C-w>v',                'Split [V]ertical' },
  { '<C-e><C-k>', '<C-w>s',                'Split [H]orizontal' },
  { '<C-e><C-t>', '<C-w>T',                'Move to separate [T]ab' },
  { '<C-e><C-q>', '<C-w>q',                '[Q]uit' },
  { '<C-e><C-r>', '<cmd>terminal<CR>',     '[R]eplace with terminal' },

  -- Plugins: Neotree & Oil
  { '\\', '<cmd>Oil<CR>',    'Files: Open [O]il' },
  { '<C-k>', '<cmd>Oil<CR>', 'Files: Open [O]il' },

  -- Plugins: Telescope
  { 'gd',          telescope.lsp_definitions,               '[D]efinitions' },
  { 'gr',          telescope.lsp_references,                '[R]eferences' },
  { 'gI',          telescope.lsp_implementations,           '[I]mplementations' },
  { '<leader>lD',  telescope.lsp_type_definitions,          'Type [D]efinitions' },
  { '<leader>sh',  telescope.help_tags,                     '[H]elp tags' },
  { '<leader>sk',  telescope.keymaps,                       '[K]eymaps' },
  { '<leader>sf',  telescope.find_files,                    '[F]iles' },
  { '<leader>sw',  telescope.grep_string,                   'Current [W]ord' },
  { '<leader>sg',  telescope.live_grep,                     '[G]rep' },
  { '<leader>sd',  telescope.diagnostics,                   '[D]iagnostics' },
  { '<leader>sr',  telescope.resume,                        '[R]esume' },
  { '<leader>s.',  telescope.oldfiles,                      'Recent files' },
  { '<leader>b',   telescope.buffers,                       '[B]uffers' },
  { '<leader>sD',  telescope.lsp_document_symbols,          '[D]ocument symbols' },
  { '<leader>ssd', telescope.lsp_definitions,               '[D]efinitions' },
  { '<leader>ssr', telescope.lsp_references,                '[R]eferences' },
  { '<leader>ssi', telescope.lsp_implementations,           '[I]mplementations' },
  { '<leader>sst', telescope.lsp_type_definitions,          '[T]ype definitions' },
  { '<leader>sss', telescope.lsp_dynamic_workspace_symbols, '[S]ymbols' },
  { '<leader>ssS', telescope.builtin,                       'Re[S]tore' },

  -- LSP
  { 'gD', vim.lsp.buf.declaration,                                                        'LSP [D]eclaration' },
  { '<leader>lr', lsp.buf.rename,                                                         'LSP [R]ename' },
  { '<leader>lc', lsp.buf.code_action,                                                    'LSP [C]ode action', { 'n', 'x' } },
  { '<leader>ls', lsp.buf.document_symbol,                                                'LSP Document [S]ymbols' },
  { '<leader>ll', lsp.codelens.run,                                                       'LSP Run code[L]ens' },
  { '<leader>li', vim.cmd.lspinfo,                                                        'LSP [I]nfo' },
  { '<leader>lF', vim.cmd.FormatToggle,                                                   'LSP Toggle [F]ormat' },
  { '<leader>lI', vim.cmd.Mason,                                                          'LSP [M]ason' },
  { '<leader>lS', lsp.buf.workspace_symbol,                                               'LSP Workspace [S]ymbols' },
  { '<leader>la', lsp.buf.code_action,                                                    'LSP Code [A]ction' },
  { '<leader>Th', function() lsp.inlay_hint.enable(not lsp.inlay_hint.is_enabled {}) end, 'LSP Toggle [H]ints' },
  { 'gD', function()
      local ok, diag = pcall(require, 'rj.extras.definition')
      if ok then diag.get_def() end
    end, 'LSP: [D]efinition in float' },

  -- Neogit
  { 'Z', function() vim.cmd 'Neogit' end, 'Neogit: Open' },

  -- Colormanager
  { '<leader>cs', require('colormanager').select, '[S]elect Colorscheme' },
  { '<leader>ct', require('colormanager').toggle, '[T]oggle Theme' },
}
-- stylua: ignore end

if vim.g.neovide then
  local maps = {
    { '<C-=>', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1 end, '', { 'n', 'v', 'i' } },
    { '<C-->', function() vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1 end, '', { 'n', 'v', 'i' } },
    { '<C-0>', function() vim.g.neovide_scale_factor = 1 end, '', { 'n', 'v', 'i' } },
  }

  for _, mapping in ipairs(maps) do
    table.insert(keymaps, mapping)
  end
end

local function map(keys, func, desc, mode)
  mode = mode or 'n'
  vim.keymap.set(mode, keys, func, { desc = desc })
end

for _, mapping in ipairs(keymaps) do
  map(unpack(mapping))
end
