pack {
  src = 'https://github.com/rcarriga/nvim-notify',
  opts = {
    timeout = 2100,
    render = 'minimal',
    stages = 'static',
    background_colour = 'NormalFloat',
    minimum_width = 20,
    top_down = false,
    icons = {
      ERROR = icons.diagnostic.error,
      WARN = icons.diagnostic.warn,
      INFO = icons.diagnostic.info,
      DEBUG = icons.diagnostic.hint,
      TRACE = icons.diagnostic.hint,
    },
  },
  -- stylua: ignore start
  config = function(opts)
    require('notify').setup(opts)

    local set_colors = function()
      local hl = {}

      local err   = vim.api.nvim_get_hl(0, { name = 'DiagnosticError' })
      local warn  = vim.api.nvim_get_hl(0, { name = 'DiagnosticWarn' })
      local info  = vim.api.nvim_get_hl(0, { name = 'DiagnosticInfo' })
      local hint  = vim.api.nvim_get_hl(0, { name = 'DiagnosticHint' })
      local float = vim.api.nvim_get_hl(0, { name = 'Float' })

      vim
        .iter({
          'NotifyERRORBorder',
          'NotifyERRORIcon',
          'NotifyERRORTitle',
          'NotifyWARNIcon',
          'NotifyWARNBorder',
          'NotifyWARNTitle',
          'NotifyINFOBorder',
          'NotifyINFOIcon',
          'NotifyINFOTitle',
          'NotifyDEBUGBorder',
          'NotifyDEBUGTitle',
          'NotifyDEBUGIcon',
          'NotifyTRACEBorder',
          'NotifyTRACEIcon',
          'NotifyTRACETitle',
          'NotifyERRORBody',
          'NotifyWARNBody',
          'NotifyINFOBody',
          'NotifyDEBUGBody',
          'NotifyTRACEBody',
        })
        :each(function(hg)
          vim.api.nvim_set_hl(0, hg, {})
        end)

      hl['NotifyERRORBorder'] = { fg = err.fg,  bg = float.bg, guifg = nil }
      hl['NotifyERRORIcon']   = { fg = err.fg,  bg = float.bg, guifg = nil }
      hl['NotifyERRORTitle']  = { fg = err.fg,  bg = float.bg, guifg = nil }
      hl['NotifyWARNIcon']    = { fg = warn.fg, bg = float.bg, guifg = nil }
      hl['NotifyWARNBorder']  = { fg = warn.fg, bg = float.bg, guifg = nil }
      hl['NotifyWARNTitle']   = { fg = warn.fg, bg = float.bg, guifg = nil }
      hl['NotifyINFOBorder']  = { fg = info.fg, bg = float.bg, guifg = nil }
      hl['NotifyINFOIcon']    = { fg = info.fg, bg = float.bg, guifg = nil }
      hl['NotifyINFOTitle']   = { fg = info.fg, bg = float.bg, guifg = nil }
      hl['NotifyDEBUGBorder'] = { fg = hint.fg, bg = float.bg, guifg = nil }
      hl['NotifyDEBUGTitle']  = { fg = hint.fg, bg = float.bg, guifg = nil }
      hl['NotifyDEBUGIcon']   = { fg = hint.fg, bg = float.bg, guifg = nil }
      hl['NotifyTRACEBorder'] = { fg = hint.fg, bg = float.bg, guifg = nil }
      hl['NotifyTRACEIcon']   = { fg = hint.fg, bg = float.bg, guifg = nil }
      hl['NotifyTRACETitle']  = { fg = hint.fg, bg = float.bg, guifg = nil }

      hl['NotifyERRORBody']   = { fg = float.fg, bg = float.bg }
      hl['NotifyWARNBody']    = { fg = float.fg, bg = float.bg }
      hl['NotifyINFOBody']    = { fg = float.fg, bg = float.bg }
      hl['NotifyDEBUGBody']   = { fg = float.fg, bg = float.bg }
      hl['NotifyTRACEBody']   = { fg = float.fg, bg = float.bg }

      for key, value in pairs(hl) do
        vim.api.nvim_set_hl(0, key, value)
      end
    end

    set_colors()
    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = set_colors
    })

  end,
  -- stylua: ignore end
}
