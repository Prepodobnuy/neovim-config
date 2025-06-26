local gruvbox = require 'colors.gruvbox'
local everforest = require 'colors.everforest'
local evergarden = require 'colors.evergarder'
local kanagawa = require 'colors.kanagawa'
local tokyonight = require 'colors.tokyonight'

local M = {}

M.packages = {
  priority = 1000,
  gruvbox.package,
  everforest.package,
  evergarden.package,
  kanagawa.package,
  tokyonight.package,
}

M.dark = {
  tokyonight = tokyonight.dark,
  gruvbox = gruvbox.set,
  everforest = everforest.set,
  evergarden = evergarden.set,
  kanagawa = kanagawa.set,
}

M.light = {
  tokyonight = tokyonight.light,
}

return M
