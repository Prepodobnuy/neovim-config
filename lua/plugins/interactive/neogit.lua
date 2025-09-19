-- https://github.com/NeogitOrg/neogit

return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  opts = {
    kind = 'tab',
  },
  floating = {
    relative = 'editor',
    width = 0.95,
    height = 0.95,
    style = 'minimal',
    border = 'none',
  },
}
