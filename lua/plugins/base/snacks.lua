local icon = require('shared.icons').dashboard_mark
local ascii = require 'shared.ascii'

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    dashboard = {
      width = 50,
      row = 7,
      col = nil,
      pane_gap = 0,
      autokeys = '1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ',
      preset = {
        pick = nil,
        keys = {
          { icon = icon, key = 'n', desc = 'New File', action = ':ene | startinsert' },
          { icon = icon, key = 'f', desc = 'Files',    action = ':Oil' },
          { icon = icon, key = 't', desc = 'Terminal', action = ':terminal' },
          -- { icon = icon, key = 'c', desc = 'Colorscheme', action = require('colormanager').select },
          { icon = icon, key = 'L', desc = 'Lazy',     action = ':Lazy' },
          { icon = icon, key = 'M', desc = 'Mason',    action = ':Mason' },
          { icon = icon, key = 'q', desc = 'Quit',     action = ':qa' },
        },
        header = ascii.random(),
      },
      formats = {
        icon = function(item)
          if item.file and item.icon == 'file' or item.icon == 'directory' then return M.icon(item.file, item.icon) end
          return { item.icon, width = 0, hl = 'icon' }
        end,
        footer = { '%s', align = 'center' },
        header = { '%s', align = 'center' },
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ':~')
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ':h')
            local file = vim.fn.fnamemodify(fname, ':t')
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. '/…' .. file
            end
          end
          local dir, file = fname:match '^(.*)/(.+)$'
          return dir and { { dir .. '/', hl = 'dir' }, { file, hl = 'file' } } or { { fname, hl = 'file' } }
        end,
      },
      sections = {
        { section = 'header', width = 100 },
        -- {
        --   section = 'terminal',
        --   cmd = 'chafa ~/.config/nvim/brisket.jpg -c 256 --format symbols --symbols vhalf --size 50x8 --stretch',
        --   padding = 1,
        --   height = 8,
        --   width = 50,
        -- },
        {
          section = 'keys',
          gap = 0,
          padding = 1,
          width = 10,
        },
        { section = 'startup' },
      },
    },
    bigfile = { enabled = false },
    explorer = { enabled = false },
    indent = { enabled = false },
    input = { enabled = false },
    picker = { enabled = false },
    notifier = { enabled = false },
    quickfile = { enabled = false },
    scope = { enabled = false },
    scroll = { enabled = false },
    statuscolumn = { enabled = false },
    words = { enabled = false },
  },
  init = function()
    vim.api.nvim_create_autocmd('User', {
      pattern = 'VeryLazy',
      callback = function()
        _G.dd = function(...) Snacks.debug.inspect(...) end
        _G.bt = function() Snacks.debug.backtrace() end
        vim.print = _G.dd

        Snacks.toggle.option('background', { off = 'light', on = 'dark', name = 'Dark Background' }):map '<leader>v'
      end,
    })
  end,
}
