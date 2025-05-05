local config = require 'cuddlefish.config'

local cuddlefish = {}

---@param cfg? cuddlefish.types.config|table
function cuddlefish.setup(cfg)
  cfg = cfg or {}
  config.set(config.override(cfg))
end

---@param cfg? cuddlefish.types.config|table
function cuddlefish.load(cfg)
  if vim.g.colors_name then
    vim.cmd 'hi clear'
  end

  vim.g.colors_name = 'cuddlefish'
  vim.o.termguicolors = true

  if cfg then
    cfg = config.override(cfg or {})
  else
    cfg = config.get()
  end

  if cfg.theme.variant == 'summer' then
    vim.go.background = 'light'
  else
    vim.go.background = 'dark'
  end

  local cache = cfg.cache or false
  if cache then
    local needs_compile = require('cuddlefish.cache').needs_compile(cfg)
    if not needs_compile then
      return require('cuddlefish.cache').load()
    end
    require('cuddlefish.cache').clear()
  end

  local theme = require('cuddlefish.theme').setup(cfg)
  local hlgroups = require('cuddlefish.hl').setup(theme, cfg)
  require('cuddlefish.utils').set_highlights(hlgroups)

  if cache then
    require('cuddlefish.cache').write(cfg)
  end
end

function cuddlefish.colors()
  return require('cuddlefish.colors').get()
end

return cuddlefish
