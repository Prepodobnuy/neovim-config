local M = {}

M.init = function()
  vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank() end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'typescript', 'javascript', 'vue', 'css', 'sass', 'scss', 'json', 'xml', 'ui', 'lua', 'svelte' },
    callback = function()
      vim.opt_local.tabstop = 2
      vim.opt_local.shiftwidth = 2
      vim.opt_local.softtabstop = 2
      vim.opt_local.expandtab = true
    end,
  })

  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'sql' },
    callback = function()
      vim.opt_local.tabstop = 4
      vim.opt_local.shiftwidth = 4
      vim.opt_local.softtabstop = 4
      vim.opt_local.expandtab = true
    end,
  })
end

return M
