local winst = require 'modules.winst'
local colmgr = require 'colormanager'
local macro = require 'nvim-macros'
local neogit = require 'neogit'
local tscope = require 'telescope.builtin'
local lsp = vim.lsp

-- stylua: ignore start

local keymaps = {
  -- Macros
  { '<leader>ml', macro.select_and_yank_macro, 'Macros: [L]oad macro' },
  { '<leader>ms', macro.save_macro,            'Macros: [S]ave macro' },
  { '<leader>md', macro.delete_macro,          'Macros: [D]elete macro' },

  { '<leader>re',  '"hy:%s/<C-r>h/<C-r>h/gc<left><left><left>', 'Search/Replace: [R]eplace selected text', 'v' },

  -- Diagnostic
  { '<leader>dq', vim.diagnostic.setloclist,                         'Diagnostic: Open [Q]uickfix list' },
  { '<leader>dj', function() vim.diagnostic.jump { count = 1 } end,  'Diagnostic: [J]ump to next' },
  { '<leader>dk', function() vim.diagnostic.jump { count = -1 } end, 'Diagnostic: [K]ump to prev' },

  -- Window managemenete
  { '<C-e>f',     winst.focus,   'Windows: [F]ocus' },
  { '<C-e>F',     winst.efocus,  'Windows: Endless [F]ocus' },
  { '<C-e>s',     winst.swap,    'Windows: [S]wap' },
  { '<C-e>S',     winst.eswap,   'Windows: Endless [S]wap' },
  { '<C-e>e',     winst.split,   'Windows: Split' },
  { '<C-e>E',     winst.esplit,  'Windows: [E]ndless Split' },
  { '<C-e>c',     winst.close,   'Windows: [C]lose' },
  { '<C-e>C',     winst.eclose,  'Windows: Endless [C]lose' },
  { '<C-e><C-q>', winst.tprev,   'Tabs: Next prev' },
  { '<C-e><C-w>', winst.tnext,   'Tabs: Next tab' },
  { '<C-e><C-e>', winst.termtab, 'Tabs: Terminal' },
  { '<C-e><C-r>', winst.tnew,    'Tabs: New tab' },
  { '<C-e>r',     winst.term,    'Tabs: Terminal' },

  -- Terminal
  { '<Esc>', '<cmd>nohlsearch<CR>', '' },
  { '<Esc><Esc>', '<C-\\><C-n>', 'Terminal: Exit insert mode', 't' },

  -- Tabs and windows
  { '<C-w><C-r>', '<cmd>tab terminal<CR>', 'Create te[R]minal tab' },
  { '<C-w><C-c>', '<cmd>tabclose<CR>',     '[C]lose' },
  { '<C-w><C-t>', '<cmd>tabnew<CR>',       'Create new [T]ab' },
  { '<C-w><C-w>', '<cmd>tabnext<CR>',      '[N]ext' },
  { '<C-w><C-q>', '<cmd>tabprev<CR>',      '[P]revious' },
  { '<C-,>',      '<C-w>>',                'Increase width' },
  { '<C-.>',      '<C-w><',                'Decrease width' },
  { '<C-n>',      '<C-w>+',                'Increase height' },
  { '<C-m>',      '<C-w>-',                'Decrease height' },

  -- Oil
  { '<C-k>', '<cmd>Oil<CR>', 'Files: Open [O]il' },

  -- Telescope
  { 'gd',          tscope.lsp_definitions,               '[D]efinitions' },
  { 'gr',          tscope.lsp_references,                '[R]eferences' },
  { 'gI',          tscope.lsp_implementations,           '[I]mplementations' },
  { '<leader>lD',  tscope.lsp_type_definitions,          'Type [D]efinitions' },
  { '<leader>sh',  tscope.help_tags,                     '[H]elp tags' },
  { '<leader>sk',  tscope.keymaps,                       '[K]eymaps' },
  { '<leader>sf',  tscope.find_files,                    '[F]iles' },
  { '<leader>sw',  tscope.grep_string,                   'Current [W]ord' },
  { '<leader>sg',  tscope.live_grep,                     '[G]rep' },
  { '<leader>sd',  tscope.diagnostics,                   '[D]iagnostics' },
  { '<leader>sr',  tscope.resume,                        '[R]esume' },
  { '<leader>s.',  tscope.oldfiles,                      'Recent files' },
  { '<leader>b',   tscope.buffers,                       '[B]uffers' },
  { '<leader>sD',  tscope.lsp_document_symbols,          '[D]ocument symbols' },
  { '<leader>ssd', tscope.lsp_definitions,               '[D]efinitions' },
  { '<leader>ssr', tscope.lsp_references,                '[R]eferences' },
  { '<leader>ssi', tscope.lsp_implementations,           '[I]mplementations' },
  { '<leader>sst', tscope.lsp_type_definitions,          '[T]ype definitions' },
  { '<leader>sss', tscope.lsp_dynamic_workspace_symbols, '[S]ymbols' },
  { '<leader>ssS', tscope.builtin,                       'Re[S]tore' },

  -- LSP
  { 'gD',         lsp.buf.declaration,                                                    'LSP [D]eclaration' },
  { '<leader>lr', lsp.buf.rename,                                                         'LSP [R]ename' },
  { '<leader>lc', lsp.buf.code_action,                                                    'LSP [C]ode action', { 'n', 'x' } },
  { '<leader>ls', lsp.buf.document_symbol,                                                'LSP Document [S]ymbols' },
  { '<leader>ll', lsp.codelens.run,                                                       'LSP Run code[L]ens' },
  { '<leader>li', vim.cmd.LspInfo,                                                        'LSP [I]nfo' },
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
  { 'Z', neogit.open, 'Neogit: Open' },

  -- Colormanager
  { '<leader>cs', colmgr.select, '[S]elect Colorscheme' },
  { '<leader>ct', colmgr.toggle, '[T]oggle Theme' },
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
