-- stylua: ignore start
local M = {}

M.diagnostic = {
  error = 'Ｅ',
  warn =  'Ｗ',
  hint =  'Ｈ',
  info =  'Ｉ',
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
