local icons = require 'shared.icons'

return {
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'mason-org/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      { 'j-hui/fidget.nvim', opts = {} },
      'saghen/blink.cmp',
    },

    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
        callback = function(event)
          local function client_supports_method(client, method, bufnr)
            if not client then return false end
            if vim.fn.has 'nvim-0.11' == 1 then
              return client:supports_method(method, bufnr)
            else
              return client.supports_method(method, { bufnr = bufnr })
            end
          end

          local client = vim.lsp.get_client_by_id(event.data.client_id)
          if not client then return end

          if client_supports_method(client, 'textDocument/documentHighlight', event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })

            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = function()
                if client and client_supports_method(client, 'textDocument/documentHighlight', event.buf) then
                  vim.lsp.buf.document_highlight()
                end
              end,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
              buffer = event.buf,
              group = highlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
              group = highlight_augroup,
              buffer = event.buf,
              callback = function()
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = highlight_augroup, buffer = event.buf }
              end,
            })
          end

          if client_supports_method(client, 'textDocument/inlayHint', event.buf) then
            vim.keymap.set(
              'n',
              '<leader>th',
              function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }) end,
              { desc = '[T]oggle Inlay [H]ints', buffer = event.buf }
            )
          end
        end,
      })

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local lspconfig = require 'lspconfig'

      local vuels_path = vim.fn.expand '$MASON/bin/vue-language-server/node_modules/@vue/language-server'
      local vue_language_server_path = vim.fn.expand '$MASON/packages'
        .. '/vue-language-server'
        .. '/node_modules/@vue/language-server'

      local vue_plugin = {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
        configNamespace = 'typescript',
      }

      local vtsls_config = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
      }

      local vue_ls_config = {
        on_init = function(client)
          client.handlers['tsserver/request'] = function(_, result, context)
            local clients = vim.lsp.get_clients { bufnr = context.bufnr, name = 'vtsls' }
            if #clients == 0 then
              vim.notify('Could not found `vtsls` lsp client, vue_lsp would not work without it.', vim.log.levels.ERROR)
              return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
              title = 'vue_request_forward', -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
              command = 'typescript.tsserverRequest',
              arguments = {
                command,
                payload,
              },
            }, { bufnr = context.bufnr }, function(_, r)
              local response_data = { { id, r.body } }
              ---@diagnostic disable-next-line: param-type-mismatch
              client:notify('tsserver/response', response_data)
            end)
          end
        end,
      }

      vim.lsp.config('vtsls', vtsls_config)
      vim.lsp.config('vue_ls', vue_ls_config)
      vim.lsp.enable { 'vtsls', 'vue_ls' }

      local servers = {
        pyright = {},
        rust_analyzer = {},
        ts_ls = {
          init_options = {
            plugins = {
              {
                name = '@vue/typescript-plugin',
                location = vuels_path,
                languages = { 'vue' },
              },
            },
          },
        },
        lua_ls = {
          -- cmd = { ... },
          -- filetypes = { ... },
          -- capabilities = {},
          settings = {
            Lua = {
              runtime = {
                version = 'LuaJIT',
                path = vim.split(package.path, ';'),
              },
              completion = {
                callSnippet = 'Replace',
              },
            },
            diagnostics = {
              globals = { 'vim', 'melo' },
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }

      lspconfig.qmlls.setup {
        capabilities = capabilities,
        cmd = { 'qmlls6', '-E' },
      }
      local ensure_installed = vim.tbl_keys(servers or {})
      vim.list_extend(ensure_installed, {
        'stylua',
      })
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      require('mason-lspconfig').setup {
        ensure_installed = {},
        automatic_installation = false,
        handlers = {
          function(server_name)
            local server = servers[server_name] or {}
            -- This handles overriding only values explicitly passed
            -- by the server configuration above. Useful when disabling
            -- certain features of an LSP (for example, turning off formatting for ts_ls)
            server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
            require('lspconfig')[server_name].setup(server)
          end,
        },
      }
    end,
  },
}
