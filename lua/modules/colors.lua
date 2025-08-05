local gruvbox = require 'colors.gruvbox'
local everforest = require 'colors.everforest'
local evergarden = require 'colors.evergarder'
local kanagawa = require 'colors.kanagawa'
local tokyonight = require 'colors.tokyonight'
local tokyonight_day = require 'colors.tokyonight_day'
local gruberdarker = require 'colors.gruberdarker'

local M = {}

M.packages = {
  priority = 1000,
  gruvbox.package,
  everforest.package,
  evergarden.package,
  kanagawa.package,
  tokyonight.package,
  gruberdarker.package,
}

M.tokyonight = tokyonight.dark
M.tokyonight_day = tokyonight.light
M.gruvbox = gruvbox.set
M.everforest = everforest.set
M.evergarden = evergarden.set
M.kanagawa = kanagawa.set
M.gruberdarker = gruberdarker.set
M.tokyonight_day = tokyonight_day.set
M.tokyonight = tokyonight.set

local function colors()
  local res = {}

  res[gruvbox.title] = gruvbox
  res[everforest.title] = everforest
  res[evergarden.title] = evergarden
  res[kanagawa.title] = kanagawa
  res[tokyonight.title] = tokyonight
  res[tokyonight_day.title] = tokyonight_day
  res[gruberdarker.title] = gruberdarker

  return res
end

M.select = function()
  vim.ui.select({
    gruvbox.title,
    everforest.title,
    evergarden.title,
    kanagawa.title,
    tokyonight.title,
    tokyonight_day.title,
    gruberdarker.title,
  }, {}, function(item)
    if item == nil then return end

    colors()[item].set()
  end)
end

return M
