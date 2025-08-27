return {
  'prepodobnuy/colormanager.nvim', -- MY OWN PLUGIN WOW =) https://github.com/Prepodobnuy/colormanager.nvim
  priority = 1000,
  opts = {
    colors = {
      { name = 'Cyberdream', set = 'cyberdream' },
      { name = 'Everforest', set = 'everforest' },
      { name = 'Evergarden', set = 'evergarden' },
      { name = 'Github', dark = 'github_dark', light = 'github_light' },
      { name = 'Gruber Darker', set = 'gruber-darker' },
      { name = 'Gruvbox', set = 'gruvbox' },
      { name = 'Kanagawa', set = 'kanagawa' },
      { name = 'Mellow', set = 'mellow' },
      { name = 'Tokyonight', set = 'tokyonight' },
      { name = 'Vscode', set = 'vscode' },
    },
    fallback = 'Gruvbox',
  },
  dependencies = {
    'scottmckendry/cyberdream.nvim',
    'neanias/everforest-nvim',
    'everviolet/nvim',
    'projekt0n/github-nvim-theme',
    'blazkowolf/gruber-darker.nvim',
    'ellisonleao/gruvbox.nvim',
    'rebelot/kanagawa.nvim',
    'mellow-theme/mellow.nvim',
    'folke/tokyonight.nvim',
    'Mofiqul/vscode.nvim',
  },
}
