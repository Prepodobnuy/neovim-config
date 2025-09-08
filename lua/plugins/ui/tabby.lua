local sep = require('shared.icons').tabby.sep

return {
  'nanozuki/tabby.nvim',
  config = function()
    local theme = {
      fill = 'TabLineFill',
      head = 'TabLine',
      current_tab = 'TabLineSel',
      tab = 'TabLine',
      win = 'TabLine',
      tail = 'TabLine',
    }

    require('tabby').setup {
      line = function(line)
        local first = true
        return {
          {
            { '', hl = theme.head },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            local fs = line.sep(sep.right, hl, theme.fill)
            if first then
              fs = line.sep('', hl, theme.fill)
              first = false
            end
            return {
              fs,
              tab.is_current() and '' or '',
              tab.number(),
              tab.name(),
              tab.close_btn '',
              line.sep(sep.left, hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(
            function(win)
              return {
                line.sep(sep.right, theme.win, theme.fill),
                win.is_current() and '' or '',
                win.buf_name(),
                line.sep(sep.left, theme.win, theme.fill),
                hl = theme.win,
                margin = ' ',
              }
            end
          ),
          {
            line.sep('', theme.tail, theme.fill),
            { '', hl = theme.tail },
          },
          hl = theme.fill,
        }
      end,
    }
  end,
}
