-- https://github.com/kr40/nvim-macros

pack {
  src = 'https://github.com/kr40/nvim-macros',
  opts = {
    json_file_path = vim.fs.normalize(vim.fn.stdpath 'config' .. '/macros.json'),
    json_formatter = 'none',
  },
}
