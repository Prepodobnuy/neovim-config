local M = {}

M.diagnostic = {
  error = 'E',
  warn = 'W',
  hint = 'H',
  info = 'I',
}

M.mark = '●'
M.tab = '» '
M.trail = '·'
M.nbsp = '␣'
M.folder = {
  closed = '',
  open = '',
  empty = '󰜌',
}

return M
