-- https://github.com/lewis6991/gitsigns.nvim

local gs = icons.gs

pack {
  src = 'https://github.com/lewis6991/gitsigns.nvim',
  name = 'gitsigns',
  opts = {
    signs = {
      add = { text = gs.add },
      change = { text = gs.change },
      delete = { text = gs.delete },
      topdelete = { text = gs.topdelete },
      changedelete = { text = gs.changedelete },
    },
    on_attach = function(bufnr)
      local gitsigns = require 'gitsigns'

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal { ']c', bang = true }
        else
          gitsigns.nav_hunk 'next'
        end
      end, { desc = 'Jump to next git [c]hange' })

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal { '[c', bang = true }
        else
          gitsigns.nav_hunk 'prev'
        end
      end, { desc = 'Jump to previous git [c]hange' })

      map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle git show [b]lame line' })
      map('n', '<leader>tD', gitsigns.preview_hunk_inline, { desc = '[T]oggle git show [D]eleted' })
    end,
  },
}
