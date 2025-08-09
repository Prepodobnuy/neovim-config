return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {},
  config = function()
    require('noice').setup {
      lsp = {
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      cmdline = {
        enabled = true,
        view = 'cmdline_popup',
        opts = {},
        ---@type table<string, CmdlineFormat>
        format = {
          cmdline = { pattern = '^:', icon = ':', lang = 'vim' },
          search_down = { kind = 'search', pattern = '^/', icon = ' ', lang = 'regex' },
          search_up = { kind = 'search', pattern = '^%?', icon = ' ', lang = 'regex' },
          filter = { pattern = '^:%s*!', icon = '$', lang = 'bash' },
          lua = { pattern = { '^:%s*lua%s+', '^:%s*lua%s*=%s*', '^:%s*=%s*' }, icon = '', lang = 'lua' },
          help = { pattern = '^:%s*he?l?p?%s+', icon = '?' },
          input = { view = 'cmdline_input', icon = '󰥻 ' },
        },
      },
      presets = {
        bottom_search = false,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
      },
      views = {
        cmdline_popup = {
          position = {
            row = '100%',
            col = '0',
          },
          size = {
            width = '100%',
            height = 'auto',
          },
          border = {
            style = 'none',
            padding = { 0, 0 },
          },
          filter_options = {},
          win_options = {
            winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
          },
        },
      },
    }
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
}
