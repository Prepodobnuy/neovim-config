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
    local sl = ''
    local sr = ' '
    --           
    --       
    --        
    --          
    --    

    require('tabby').setup {
      line = function(line)
        return {
          {
            { '', hl = theme.head },
            line.sep('', theme.head, theme.fill),
          },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep(sl, hl, theme.fill),
              tab.is_current() and '' or '',
              tab.number(),
              tab.name(),
              tab.close_btn '',
              line.sep(sr, hl, theme.fill),
              hl = hl,
              margin = ' ',
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(
            function(win)
              return {
                line.sep(sl, theme.win, theme.fill),
                win.is_current() and '' or '',
                win.buf_name(),
                line.sep(sr, theme.win, theme.fill),
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
