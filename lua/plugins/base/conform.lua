pack {
  src = 'https://github.com/stevearc/conform.nvim.git',
  name = 'conform',
  events = { 'BufWritePre' },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      local disable_filetypes = { c = true, cpp = true }
      local lsp_format_opt
      if disable_filetypes[vim.bo[bufnr].filetype] then
        lsp_format_opt = 'never'
      else
        lsp_format_opt = 'fallback'
      end
      return {
        timeout_ms = 1000,
        lsp_format = lsp_format_opt,
      }
    end,
    formatters_by_ft = {
      lua = { 'stylua', prepend_args = { '--indent-type', 'Spaces', '--syntax', 'All' } },
      python = { 'ruff format %s' },
      rust = { 'rustfmt', lsp_format = 'fallback' },
      javascript = { 'prettier', stop_after_first = true },
      typescript = { 'prettier', stop_after_first = true },
      vue = { 'prettier', stop_after_first = true },
      html = { 'prettier', stop_after_first = true },
      -- css = { 'prettier', stop_after_first = true },
      scss = { 'prettier', stop_after_first = true },
      sass = { 'prettier', stop_after_first = true },
    },
  },
}
