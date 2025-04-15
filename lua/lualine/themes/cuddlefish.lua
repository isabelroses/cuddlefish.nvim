local theme = require('cuddlefish.theme').setup()
local config = require('cuddlefish.config').get()

local colors = {
  normal = theme.accent,
  insert = theme.text,
  visual = theme.syntax.constant,
}

local cuddlefish = {}

cuddlefish.normal = {
  a = { fg = theme.crust, bg = colors.normal },
  b = { bg = theme.surface0, fg = colors.normal },
  c = {
    bg = config.editor.transparent_background and theme.none or theme.base,
    fg = theme.overlay2,
  },
}

cuddlefish.insert = {
  a = { fg = theme.crust, bg = colors.insert },
  b = { bg = theme.surface0, fg = colors.insert },
}

cuddlefish.command = cuddlefish.normal

cuddlefish.visual = {
  a = { fg = theme.crust, bg = colors.visual },
  b = { bg = theme.surface0, fg = colors.visual },
}

cuddlefish.replace = cuddlefish.insert

cuddlefish.inactive = {
  a = { bg = theme.base, fg = theme.overlay1 },
  b = { bg = theme.base, fg = theme.overlay1 },
  c = {
    bg = config.editor.transparent_background and theme.none or theme.base,
    fg = theme.overlay1,
  },
}

return cuddlefish
