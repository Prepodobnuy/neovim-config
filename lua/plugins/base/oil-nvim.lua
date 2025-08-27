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
      ['<C-k>'] = { 'actions.parent', mode = 'n' },
      ['<C-j>'] = { 'actions.select', mode = 'n' },
      ['\\'] = { 'actions.close', mode = 'n' },
      ['r'] = { 'actions.refresh', mode = 'n' },
      ['h'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g?'] = { 'actions.show_help', mode = 'n' },
    },

    use_default_keymaps = false,

    view_options = {
      is_always_hidden = function(name, bufnr) return false end,
    },
  },

  config = function(_, opts) require('oil').setup(opts) end,
}
