return {
  { 'navarasu/onedark.nvim', lazy = true },
  { 'sainnhe/edge', lazy = true },
  { 'sainnhe/sonokai', lazy = true },
  { 'sainnhe/gruvbox-material', lazy = true },
  { 'sainnhe/everforest', lazy = true },
  { 'EdenEast/nightfox.nvim', lazy = true },
  { 'catppuccin/nvim', name = 'catppuccin', lazy = true },
  { 'olimorris/onedarkpro.nvim', lazy = true },
  { 'marko-cerovac/material.nvim', lazy = true },
  {
    'rockyzhang24/arctic.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    name = 'arctic',
    branch = 'v2',
  },
  {
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
    end,
    lazy = true,
  },
  { 'rebelot/kanagawa.nvim', lazy = true },
}
