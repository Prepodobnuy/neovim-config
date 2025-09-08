-- https://github.com/kr40/nvim-macros

return {
  'kr40/nvim-macros',

  cmd = { 'MacroSave', 'MacroYank', 'MacroSelect', 'MacroDelete' },

  opts = {
    json_file_path = vim.fs.normalize(vim.fn.stdpath 'config' .. '/macros.json'),
    json_formatter = 'none',
  },
}
