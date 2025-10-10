-- https://github.com/Prepodobnuy/colormanager.nvim

pack { src = 'https://github.com/savq/melange-nvim' }
pack { src = 'https://github.com/scottmckendry/cyberdream.nvim' }
pack { src = 'https://github.com/neanias/everforest-nvim' }
pack { src = 'https://github.com/everviolet/nvim' }
pack { src = 'https://github.com/projekt0n/github-nvim-theme' }
pack { src = 'https://github.com/blazkowolf/gruber-darker.nvim' }
pack { src = 'https://github.com/ellisonleao/gruvbox.nvim' }
pack { src = 'https://github.com/rebelot/kanagawa.nvim' }
pack { src = 'https://github.com/mellow-theme/mellow.nvim' }
pack { src = 'https://github.com/folke/tokyonight.nvim' }
pack { src = 'https://github.com/Mofiqul/vscode.nvim' }
pack { src = 'https://github.com/jacoborus/tender.vim' }
pack { src = 'https://github.com/mcauley-penney/techbase.nvim' }
pack { src = 'https://github.com/Prepodobnuy/soyjack.nvim' }
pack { src = 'https://github.com/NTBBloodbath/doom-one.nvim' }

pack {
  src = 'https://github.com/prepodobnuy/colormanager.nvim',
  name = 'colormanager',
  opts = {
    colors = {
      { name = 'Melange', set = 'melange' },
      { name = 'Default', set = 'default' },
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
      { name = 'Tender', set = 'tender' },
      { name = 'Techbase', set = 'techbase' },
      { name = 'Soyjack', set = 'soyjack' },
      { name = 'Doom-one', set = 'doom-one' },
    },
    fallback = 'Melange',
  },
}
