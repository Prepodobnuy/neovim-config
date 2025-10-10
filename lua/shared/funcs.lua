local M = {}

local counter = 0
local buildable = {}

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(event)
    if event.data.kind == 'update' then
      vim.notify('Running packages builds', vim.log.levels.INFO)
      for _, v in buildable do
        pcall(v)
      end
    end
  end,
})

---@param event string
---@param callback function
---@param augroup integer
---
--- load function on vim event
local function __lazyload(event, callback, augroup)
  vim.api.nvim_create_autocmd(event, {
    group = augroup,
    callback = function()
      vim.api.nvim_del_augroup_by_id(augroup)
      callback()
    end,
    once = true,
  })
end

---@param event string[]
---@param callback function
---
--- load function on vim events
function M.lazyload(event, callback)
  counter = counter + 1
  local augroup = vim.api.nvim_create_augroup('LazyLoad#' .. counter, { clear = true })

  for _, v in ipairs(event) do
    __lazyload(v, callback, augroup)
  end
end

---@class PackOpts
---
--- URI from which to install and pull updates. Any format supported by `git clone` is allowed.
---@field src string
---
--- Name of plugin. Will be used as directory name. Default: `src` repository name.
---@field name string?
---
--- Version to use for install and updates. Can be:
--- - `nil` (no value, default) to use repository's default branch (usually `main` or `master`).
--- - String to use specific branch, tag, or commit hash.
--- - Output of |vim.version.range()| to install the greatest/last semver tag
---   inside the version constraint.
---@field version? string|vim.VersionRange
---
---@field data? any Arbitrary data associated with a plugin.
---
---@field events string[]?
---@field opts table?
---@field build? fun()
---@field config? fun(opts: table?)

---@param opts PackOpts
function M.pack(opts)
  opts = opts or {}

  if not opts.src then return end

  if opts.build then table.insert(buildable, opts.build) end

  local packopts = { src = opts.src, name = opts.name, version = opts.version, data = opts.data }
  vim.pack.add { packopts }

  local load = function()
    if opts.config then
      opts.config(opts.opts or {})
    else
      local status, plugin = pcall(require, opts.name)
      if status and plugin.setup then plugin.setup(opts.opts or {}) end
    end

    if opts.build then opts.build() end
  end

  if opts.events then
    M.lazyload(opts.events, load)
    return
  end

  load()
end

return M
