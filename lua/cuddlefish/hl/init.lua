local M = {}

---@param theme cuddlefish.types.theme
---@param config cuddlefish.types.config
---@return cuddlefish.types.hlgroups.OL
function M.setup(theme, config)
  ---@type cuddlefish.types.hlgroups.OL
  local hl_groups = {}

  local load_hl = require('cuddlefish.utils').make_hl_loader(
    hl_groups,
    { theme = theme, config = config }
  )

  load_hl(
    'cuddlefish.hl.%s',
    { 'editor', 'syntax', 'treesitter', 'diagnostics' }
  )
  load_hl('cuddlefish.hl.ft.%s', { })

  load_hl(
    'cuddlefish.hl.integrations.%s',
    vim
      .iter(pairs(config.integrations))
      :map(function(name, props)
        if
          not (
            (type(props) == 'table' and props.enable)
            or (type(props) == 'boolean' and props)
          )
        then
          return
        end
        return name
      end)
      :totable()
  )

  if config.editor.override_terminal then
    require 'cuddlefish.hl.terminal'(theme)
  end

  local overrides = config.overrides or {}
  if type(overrides) == 'function' then
    overrides = overrides(theme.colors) --[[@as cuddlefish.types.hlgroups.OL]]
  end
  table.insert(hl_groups, overrides)

  return hl_groups
end

return M
