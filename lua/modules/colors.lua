local M = {}

M.packages = {
  priority = 1000,
}

local colors = {}
local titles = {}

local function add_color(color)
  table.insert(M.packages, color.package)
  table.insert(titles, color.title)
  M[color.title] = color.set
  colors[color.title] = color
end

add_color(require 'colors.gruvbox')
add_color(require 'colors.everforest')
add_color(require 'colors.evergarder')
add_color(require 'colors.kanagawa')
add_color(require 'colors.tokyonight')
add_color(require 'colors.gruberdarker')
add_color(require 'colors.mellow')
add_color(require 'colors.vscode')

local cache = vim.fn.stdpath 'data' .. '/lastcol'

M.save = function(col)
  if not col or type(col) ~= 'string' then
    vim.notify('Invalid color value provided', vim.log.levels.ERROR)
    return false
  end

  local file, err = io.open(cache, 'w')
  if not file then
    vim.notify('Failed to open file for writing: ' .. (err or 'unknown error'), vim.log.levels.ERROR)
    return false
  end

  local success, write_err = pcall(function()
    file:write(col)
    file:close()
  end)

  if not success then
    vim.notify('Failed to write to file: ' .. (write_err or 'unknown error'), vim.log.levels.ERROR)
    file:close()
    return false
  end

  return true
end

M.load = function(fallback)
  local file_exists = vim.fn.filereadable(cache) == 1
  if not file_exists then
    if fallback then fallback() end
    return nil
  end

  local file, err = io.open(cache, 'r')
  if not file then
    vim.notify('Failed to open file for reading: ' .. (err or 'unknown error'), vim.log.levels.ERROR)
    if fallback then fallback() end
    return nil
  end

  local content, read_err
  local success = pcall(function()
    content = file:read '*a'
    file:close()
  end)

  if not success then
    vim.notify('Failed to read file: ' .. (read_err or 'unknown error'), vim.log.levels.ERROR)
    file:close()
    if fallback then fallback() end
    return nil
  end

  if content and #content > 0 then
    if colors[content] and colors[content].set then colors[content].set() end
  elseif fallback then
    fallback()
  end

  return content
end

M.select = function()
  vim.ui.select(titles, {}, function(item)
    if item == nil then return end
    M.save(item)
    colors[item].set()
  end)
end

M.toggle_theme = function()
  if vim.o.background == 'dark' then
    vim.o.background = 'light'
  else
    vim.o.background = 'dark'
  end
  vim.cmd('colorscheme ' .. vim.g.colors_name)
end

return M
