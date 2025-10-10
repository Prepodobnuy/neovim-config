pack {
  src = 'https://github.com/Prepodobnuy/scratchim.nvim',
  name = 'scratchim',
  keys = {
    { '<leader>bs', '<cmd>Scratchim<cr>', desc = 'Scratch Buffer', mode = 'n' },
    { '<leader>bS', '<cmd>ScratchimSplit<cr>', desc = 'Scratch Buffer (split)', mode = 'n' },
  },
  opts = {
    buffer_name = 'Scratchim',
  },
}
