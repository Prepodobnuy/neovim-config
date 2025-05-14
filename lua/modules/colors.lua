local gruvbox = require 'colors.gruvbox'
local everforest = require 'colors.everforest'
local evergarden = require 'colors.evergarder'
local kanagawa = require 'colors.kanagawa'

local M = {}

M.packages = {
  priority = 1000,
  gruvbox.package,
  everforest.package,
  evergarden.package,
  kanagawa.package,
}

M.init = {
  gruvbox = gruvbox.set,
  everforest = everforest.set,
  evergarden = evergarden.set,
  kanagawa = kanagawa.set,
}

return M
