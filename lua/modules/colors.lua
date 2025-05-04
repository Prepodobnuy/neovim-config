local gruvbox = require 'colors.gruvbox'
local everforest = require 'colors.everforest'
local kanagawa = require 'colors.kanagawa'

local M = {}

M.packages = {
  priority = 1000,
  gruvbox.package,
  everforest.package,
  kanagawa.package,
}

M.init = {
  gruvbox = gruvbox.set,
  kanagawa = kanagawa.set,
  everforest = everforest.set,
}

return M
