-- stylua: ignore start
local M = {}

M.diagnostic = {
  error = 'E',
  warn =  'W',
  hint =  'H',
  info =  'I',
}

M.mark =           '●'
M.dashboard_mark = ''
M.tab =            '» '
M.trail =          '·'
M.nbsp =           '␣'
M.folder = {
  closed =         '',
  open =           '',
  empty =          '󰜌',
}

M.lualine_borders = {
  l = '',
  r = '',
}

M.kind = {
  Class =    ' ',
  Method =   '󰊕 ',
  Variable = ' ',
  Text =     ' ',
  Function = '󰊕 ',
  Keyword =  ' ',
  Snippet =  ' ',
  File =     ' ',
  Folder =   ' ',
}

return M
-- stylua: ignore end
