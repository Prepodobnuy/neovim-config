local M = {}

M.neck = 'Check your neck.'
M.stmgw = 'Sharp tools make good work.'
M.kys = 'Kill yourself.'
M.random = function()
  math.randomseed(os.time())
  local tips = { M.neck, M.stmgw, M.kys }
  return tips[math.random(1, #tips)]
end

-- INFO:
-- WARN:
-- TODO:

print(123 + 123 - 1232)
local a = true

return M
