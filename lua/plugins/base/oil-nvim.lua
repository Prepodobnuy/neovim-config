-- https://github.com/stevearc/oil.nvim               <- goat plugin
-- https://github.com/JezerM/oil-lsp-diagnostics.nvim <- goat plugin

local icons = require 'shared.icons'

return {
  'stevearc/oil.nvim',

  dependencies = {
    {
      'JezerM/oil-lsp-diagnostics.nvim',
      opts = {
        diagnostic_symbols = {
          error = icons.diagnostic.error,
          warn = icons.diagnostic.warn,
          info = icons.diagnostic.info,
          hint = icons.diagnostic.hint,
        },
      },
    },
  },

  cmd = 'Oil',

  opts = {
    default_file_explorer = false,

    columns = { 'icon' },

    buf_options = {
      buflisted = false,
      bufhidden = 'hide',
    },

    win_options = {
      wrap = false,
      signcolumn = 'no',
      cursorcolumn = false,
      foldcolumn = '0',
      spell = false,
      list = false,
      conceallevel = 3,
      concealcursor = 'nvic',
    },

    constrain_cursor = 'editable',
    delete_to_trash = false,
    skip_confirm_for_simple_edits = false,
    prompt_save_on_select_new_entry = true,
    cleanup_delay_ms = 2000,

    keymaps = {
      ['g?'] = { 'actions.show_help', mode = 'n' },
      ['<C-v>'] = { 'actions.select', opts = { vertical = true } },
      ['<C-h>'] = { 'actions.select', opts = { horizontal = true } },
      ['<C-t>'] = { 'actions.select', opts = { tab = true } },
      ['\\'] = { 'actions.close', mode = 'n' },
      ['<C-r>'] = 'actions.refresh',
      ['<C-k>'] = { 'actions.parent', mode = 'n' },
      ['<C-j>'] = 'actions.select',
      ['<C-p>'] = { 'actions.preview', mode = 'n' },
      ['h'] = { 'actions.toggle_hidden', mode = 'n' },
      ['_'] = { 'actions.open_cwd', mode = 'n' },
      ['`'] = { 'actions.cd', mode = 'n' },
      ['~'] = { 'actions.cd', opts = { scope = 'tab' }, mode = 'n' },
      ['gs'] = { 'actions.change_sort', mode = 'n' },
      ['gx'] = 'actions.open_external',
      ['g\\'] = { 'actions.toggle_trash', mode = 'n' },
    },

    view_options = {
      is_always_hidden = function(name, bufnr) return false end,
    },
  },

  config = function(_, opts) require('oil').setup(opts) end,
}
