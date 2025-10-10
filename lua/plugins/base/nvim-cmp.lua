-- deps
pack { src = 'https://github.com/saadparwaiz1/cmp_luasnip.git' }
pack { src = 'https://github.com/hrsh7th/cmp-nvim-lsp.git' }
pack { src = 'https://github.com/hrsh7th/cmp-nvim-lsp-signature-help.git' }
pack { src = 'https://github.com/hrsh7th/cmp-buffer.git' }
pack { src = 'https://github.com/hrsh7th/cmp-path.git' }
pack { src = 'https://github.com/roginfarrer/cmp-css-variables.git' }
pack { src = 'https://github.com/L3MON4D3/LuaSnip.git' }
pack {
  src = 'https://github.com/rafamadriz/friendly-snippets.git',
  config = function() require('luasnip.loaders.from_vscode').lazy_load() end,
}

pack {
  src = 'https://github.com/hrsh7th/nvim-cmp.git',
  events = { 'InsertEnter' },

  config = function()
    local cmp = require 'cmp'
    local luasnip = require 'luasnip'
    luasnip.config.setup {}

    cmp.setup {
      snippet = {
        expand = function(args) luasnip.lsp_expand(args.body) end,
      },
      completion = { completeopt = 'menu,menuone,noinsert' },
      mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-CR>'] = cmp.mapping.confirm { select = true },
        ['<Tab>'] = cmp.mapping.select_next_item(),
        ['<S-Tab>'] = cmp.mapping.select_prev_item(),
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then luasnip.expand_or_jump() end
        end, { 'i', 's' }),
        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then luasnip.jump(-1) end
        end, { 'i', 's' }),
      },
      sources = {
        {
          name = 'lazydev',
          group_index = 0,
        },
        { name = 'css-variables' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'buffer' },
        { name = 'nvim_lsp_signature_help' },
      },
      window = {
        completion = cmp.config.window.bordered {
          border = vim.g.winborder,
        },
      },
      formatting = {
        fields = { 'kind', 'abbr', 'menu' },
        format = function(entry, item)
          item.kind = icons.kind[item.kind] or ''
          return require('nvim-highlight-colors').format(entry, item)
        end,
      },
    }
  end,
}
