-- stylua: ignore start
local M = {}

M.diagnostic = {}
M.diagnostic.error = 'E'
M.diagnostic.warn  = 'W'
M.diagnostic.hint  = 'H'
M.diagnostic.info  = 'I'

M.folder = {}
M.mark           = '●'
M.dashboard_mark = ''
M.tab            = '» '
M.trail          = '·'
M.nbsp           = '␣'
M.folder.closed  = ''
M.folder.open    = ''
M.folder.empty   = '󰜌'

--          
M.lualine = {}
M.lualine.sep = {}
M.lualine.sep.component_left  = '' -- ''
M.lualine.sep.component_right = '' -- ''
M.lualine.sep.section_left    = ''
M.lualine.sep.section_right   = ''

M.tabby = {}
M.tabby.sep = {}
M.tabby.sep.left  = ''
M.tabby.sep.right = ''

M.kind = {}
M.kind.Class    = ' '
M.kind.Method   = '󰊕 '
M.kind.Variable = ' '
M.kind.Text     = ' '
M.kind.Function = '󰊕 '
M.kind.Keyword  = ' '
M.kind.Snippet  = ' '
M.kind.File     = ' '
M.kind.Folder   = ' '

M.gs = {}
M.gs.add          = '┃'
M.gs.change       = '┃'
M.gs.delete       = '┃'
M.gs.topdelete    = '┃'
M.gs.changedelete = '┃'

return M
-- stylua: ignore end
