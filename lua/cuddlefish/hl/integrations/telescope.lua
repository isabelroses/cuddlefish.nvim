local M = {}

---@param theme cuddlefish.types.theme
---@param _ cuddlefish.types.config
M.get = function(theme, _)
  return {
    ['TelescopeNormal'] = { link = 'NormalFloat' },
    ['TelescopePromptPrefix'] = { theme.pink },
    ['TelescopePromptNormal'] = { link = 'TelescopeNormal' },
    ['TelescopeSelection'] = { theme.none, theme.surface1 },
    ['TelescopeSelectionCaret'] = { theme.cherry, theme.surface1 },
    ['TelescopeMatching'] = { link = 'IncSearch' },
    ['TelescopeTitle'] = { link = 'FloatTitle' },
    ['TelescopeBorder'] = { link = 'FloatBorder' },
    ['TelescopePromptBorder'] = { link = 'TelescopeBorder' },
    ['TelescopeResultsBorder'] = { link = 'TelescopeBorder' },
    ['TelescopePreviewBorder'] = { link = 'TelescopeBorder' },
  }
end

return M
