-- https://github.com/brenoprata10/nvim-highlight-colors
pack {
  src = 'https://github.com/brenoprata10/nvim-highlight-colors',
  config = function()
    require('nvim-highlight-colors').setup {
      render = 'background', -- virtual
      virtual_symbol = icons.mark,
      virtual_symbol_prefix = '',
      virtual_symbol_suffix = ' ',
      virtual_symbol_position = 'eow',
      enable_hex = true,
      enable_short_hex = true,
      enable_rgb = true,
      enable_hsl = true,
      enable_ansi = true,
      enable_hsl_without_function = true,
      enable_var_usage = true,
      enable_named_colors = true,
      enable_tailwind = false,
      exclude_filetypes = {},
      exclude_buftypes = {},
      exclude_buffer = function(bufnr) return vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 1000000 end,
    }
  end,
}
