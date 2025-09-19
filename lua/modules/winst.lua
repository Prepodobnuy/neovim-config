local M = {}

local function pick_window(msg)
  return require('window-picker').pick_window {
    prompt_message = msg or '',
  }
end

---@class WindowFuncOpts
---@field endless boolean?

---@param opts WindowFuncOpts?
function M.swap(opts)
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
function M.close(opts)
  opts = opts or {}

  while true do
    local window = pick_window 'Select window to close'
    if not window then return end

    if #vim.api.nvim_tabpage_list_wins(0) == 3 then
      vim.cmd 'quit'
      return
    end

    vim.api.nvim_win_close(window, true)

    if not opts.endless then return end
  end
end

---@param opts WindowFuncOpts?
function M.focus(opts)
  opts = opts or {}

  while true do
    local window = pick_window 'Select window to focus'
    if not window then return end

    vim.api.nvim_set_current_win(window)

    if not opts.endless then return end
  end
end

---@param opts WindowFuncOpts?
function M.split(opts)
  opts = opts or {}

  while true do
    local window = pick_window 'Select window to split'

    if not window then return end

    local width = vim.api.nvim_win_get_width(window)
    local height = vim.api.nvim_win_get_height(window)

    vim.api.nvim_set_current_win(window)

    if width >= height * 2 then
      vim.cmd 'vsplit'
    else
      vim.cmd 'split'
    end

    if not opts.endless then return end
  end
end

function M.trename()
  vim.ui.input({ prompt = 'Enter new name for current tab' }, function(input) vim.cmd('TabRename ' .. input) end)
end

function M.tnew() vim.cmd 'tabnew' end
function M.tclose() vim.cmd 'tabclose' end
function M.tnext() vim.cmd 'tabnext' end
function M.tprev() vim.cmd 'tabprev' end
function M.term() vim.cmd 'terminal' end
function M.termtab()
  vim.cmd 'tabnew'
  vim.cmd 'terminal'
end

-- alias
-- stylua: ignore start
function M.eclose() M.close { endless = true } end
function M.eswap()  M.swap  { endless = true } end
function M.efocus() M.focus { endless = true } end
function M.esplit() M.split { endless = true } end

vim.api.nvim_create_user_command('Close', M.close, {})
vim.api.nvim_create_user_command('Swap',  M.swap,  {})
vim.api.nvim_create_user_command('Focus', M.focus, {})
vim.api.nvim_create_user_command('Split', M.split, {})

vim.api.nvim_create_user_command('EClose', M.eclose, {})
vim.api.nvim_create_user_command('ESwap',  M.eswap,  {})
vim.api.nvim_create_user_command('EFocus', M.efocus, {})
vim.api.nvim_create_user_command('ESplit', M.esplit, {})
-- stylua: ignore end

return M
