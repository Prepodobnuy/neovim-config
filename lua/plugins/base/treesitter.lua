return { -- requires nvim 0.11 or later
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  lazy = false,
}
