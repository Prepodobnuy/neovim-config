local options = require 'modules.options'
local hotkeys = require 'modules.hotkeys'
local autocmd = require 'modules.autocmd'
local plugins = require 'modules.lazy'
local colorscheme = require 'modules.colors'

options.init()
autocmd.init()
plugins.init()
hotkeys.init()
colorscheme.load(colorscheme.gruvbox)
