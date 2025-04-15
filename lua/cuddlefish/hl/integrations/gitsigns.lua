local M = {}

---@param theme cuddlefish.types.theme
---@param _ cuddlefish.types.config
M.get = function(theme, _)
  return {
    ['GitGutterAdd'] = { theme.diff.add, theme.sign },
    ['GitGutterChange'] = { theme.diff.change, theme.sign },
    ['GitGutterDelete'] = { theme.diff.delete, theme.sign },
    ['GitGutterChangeDelete'] = { link = 'GitGutterChange' },
  }
end

return M
