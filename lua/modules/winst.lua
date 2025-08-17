-- winst stands for win stuff

local M = {}

local function pick_window(msg)
  return require('window-picker').pick_window {
    hint = vim.g.window_picker_hint or 'floating-big-letter',
    prompt_message = msg or '',
  }
end

---@class WindowFuncOpts
---@fleld endless boolean

---@param opts WindowFuncOpts?
M.swap = function(opts)
  opts = opts or {}

  while true do
    local first_window = pick_window 'Select first window'
    if not first_window then return end
    local second_window = pick_window 'Select window to swap'
    if not second_window then return end
    if first_window == second_window then return end

    local first_buffer = vim.api.nvim_win_get_buf(first_window)
    local second_buffer = vim.api.nvim_win_get_buf(second_window)

    vim.api.nvim_win_set_buf(first_window, second_buffer)
    vim.api.nvim_win_set_buf(second_window, first_buffer)

    if not opts.endless then return end
  end
end

---@param opts WindowFuncOpts?
M.close = function(opts)
  opts = opts or {}

  while true do
    local window = pick_window 'Select window to close'
    if not window then return end
    vim.api.nvim_win_close(window, vim.g.window_picker_force_close or false)

    if not opts.endless then return end
  end
end

M.focus = function()
  local window = pick_window 'Select window to focus'
  if not window then return end
  vim.api.nvim_set_current_win(window)
end

-- aliases

M.close_endless = function() M.close { endless = true } end
M.swap_endless = function() M.swap { endless = true } end

return M
