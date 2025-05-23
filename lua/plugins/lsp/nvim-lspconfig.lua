return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'hoffs/omnisharp-extended-lsp.nvim' },
    lazy = false,
    config = function()
      local lspconfig = require 'lspconfig'
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      lspconfig.eslint.setup {
        on_attach = function(_, bufnr)
          vim.api.nvim_create_autocmd('BufWritePre', {
            buffer = bufnr,
            command = 'EslintFixAll',
          })
        end,
        on_new_config = function(config, new_root_dir)
          config.settings.workspaceFolder = {
            uri = vim.uri_from_fname(new_root_dir),
            name = vim.fn.fnamemodify(new_root_dir, ':t'),
          }
        end,
      }

      lspconfig.omnisharp.setup {
        handlers = {
          ['textDocument/definition'] = require('omnisharp_extended').handler,
        },
        cmd = { 'dotnet', 'C:/Users/sfree/AppData/Local/nvim-data/omnisharp/OmniSharp.dll' },
        capabilities = capabilities,
        settings = {
          FormattingOptions = {
            EnableEditorConfigSupport = true,
            OrganizeImports = true,
          },
          RoslynExtensionsOptions = {
            DocumentAnalysisTimeoutMs = 30000,
            EnableAnalyzersSupport = true,
            EnableImportCompletion = true,
          },
          Sdk = {
            IncludePrereleases = true,
          },
        },
      }

      lspconfig.lua_ls.setup {
        capabilities = capabilities,
      }

      lspconfig.vue_language_server.setup {
        capabilities = capabilities,
        filetypes = { 'vue' },
        init_options = {
          languageFeatures = {
            references = true,
            definition = true,
            semanticTokens = true,
            diagnostics = true,
            hover = true,
          },
        },
      }

      local mason_registry = require 'mason-registry'
      local vue_language_server = mason_registry.get_package('vue-language-server'):get_install_path() .. '/node_modules/@vue/language-server'

      lspconfig.ts_ls.setup {
        capabilities = capabilities,
        init_options = {
          plugins = {
            {
              name = '@vue/typescript-plugin',
              location = vue_language_server,
              languages = { 'vue' },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      }

      lspconfig.html.setup {
        capabilities = capabilities,
        filetypes = { 'html', 'ejs', 'javascriptreact', 'typescriptreact', 'vue' },
      }

      lspconfig.cssls.setup {
        capabilities = capabilities,
        filetypes = { 'css', 'scss', 'less', 'vue' },
      }

      lspconfig.pyright.setup {
        capabilities = capabilities,
      }

      lspconfig.lemminx.setup {
        capabilities = capabilities,
      }

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          local client = vim.lsp.get_client_by_id(ev.data.client_id)
          local omnisharp = require 'omnisharp_extended'
        end,
      })
    end,
  },
}
