local gruvbox = require 'colors.gruvbox'
local everforest = require 'colors.everforest'
local evergarden = require 'colors.evergarder'
local kanagawa = require 'colors.kanagawa'
local tokyonight = require 'colors.tokyonight'
local gruberdarker = require 'colors.gruberdarker'
local mellow = require 'colors.mellow'
local vscode = require 'colors.vscode'

local M = {}

M.packages = {
  priority = 1000,
  gruvbox.package,
  everforest.package,
  evergarden.package,
  kanagawa.package,
  tokyonight.package,
  gruberdarker.package,
  mellow.package,
  vscode.package,
}

M.tokyonight = tokyonight.set
M.gruvbox = gruvbox.set
M.everforest = everforest.set
M.evergarden = evergarden.set
M.kanagawa = kanagawa.set
M.gruberdarker = gruberdarker.set
M.mellow = mellow.set
M.vscode = vscode.set

local function colors()
  local res = {}

  res[gruvbox.title] = gruvbox
  res[everforest.title] = everforest
  res[evergarden.title] = evergarden
  res[kanagawa.title] = kanagawa
  res[tokyonight.title] = tokyonight
  res[gruberdarker.title] = gruberdarker
  res[mellow.title] = mellow
  res[vscode.title] = vscode

  return res
end

local cache = vim.fn.expand '~/.cache/nvim-last-colorscheme'

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
    if colors()[content] and colors()[content].set then colors()[content].set() end
  elseif fallback then
    fallback()
  end

  return content
end

M.select = function()
  vim.ui.select({
    gruvbox.title,
    everforest.title,
    evergarden.title,
    kanagawa.title,
    tokyonight.title,
    gruberdarker.title,
    mellow.title,
    vscode.title,
  }, {}, function(item)
    if item == nil then return end
    M.save(item)
    colors()[item].set()
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
