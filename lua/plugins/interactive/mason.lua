-- https://github.com/mason-org/mason.nvim

return {
  'mason-org/mason.nvim',
  opts = {
    PATH = 'prepend', -- prepend | append | skip
    max_concurrent_installers = 4,
  },
}
