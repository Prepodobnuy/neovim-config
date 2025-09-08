require 'modules.options'
require 'modules.lazy'
require 'modules.lsp'
require 'modules.hotkeys'
require 'modules.autocmd'

function GetInstalledLSPServers()
  local mason_registry = require 'mason-registry'
  local installed = mason_registry.get_installed_packages()

  local lsp_servers = {}
  for _, pkg in ipairs(installed) do
    if pkg.spec.type == 'lsp' then
      table.insert(lsp_servers, {
        name = pkg.name,
        version = pkg:get_installed_version(),
        path = pkg:get_install_path(),
      })
    end
  end

  return lsp_servers
end

local servers = GetInstalledLSPServers()
for _, server in ipairs(servers) do
  print(string.format('%s: %s', server.name, server.version))
end
