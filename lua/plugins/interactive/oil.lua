-- https://github.com/stevearc/oil.nvim
-- https://github.com/JezerM/oil-lsp-diagnostics.nvim

local diagnostic = icons.diagnostic

pack {
  src = 'https://github.com/JezerM/oil-lsp-diagnostics.nvim',
  name = 'oil-lsp-diagnostics',
  opts = {
    diagnostic_symbols = {
      error = diagnostic.error,
      warn = diagnostic.warn,
      info = diagnostic.info,
      hint = diagnostic.hint,
    },
  },
}

pack {
  src = 'https://github.com/stevearc/oil.nvim',
  opts = {
    default_file_explorer = false,

    -- columns = { 'icon' },
    columns = {},

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
      ['<C-r>'] = { 'actions.refresh', mode = 'n' },
      ['<C-h>'] = { 'actions.toggle_hidden', mode = 'n' },
      ['g?'] = { 'actions.show_help', mode = 'n' },
    },

    use_default_keymaps = false,

    view_options = {
      is_always_hidden = function(name, bufnr) return false end,
    },
  },

  config = function(opts) require('oil').setup(opts) end,
}
