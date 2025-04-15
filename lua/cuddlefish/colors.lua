local M = {}

---@type cuddlefish.types.colors
M.colors = {
  red = '#F6598E',
  orange = '#F09262',
  yellow = '#EDE874',
  lime = '#C2E774',
  green = '#91E478',
  aqua = '#83EDCF',
  skye = '#86DCE9',
  snow = '#83C4E6',
  blue = '#7796DF',
  purple = '#8B79E8',
  violet = '#B37FED',
  pink = '#F186ED',
  cherry = '#CC6D91',
}

---@type cuddlefish.types.colors
M.shades = {
  text = "#DCDEFF";
  subtext1 = "#B6B8DE";
  subtext0 = "#999AC7";
  overlay2 = "#8787B2";
  overlay1 = "#6D6D93";
  overlay0 = "#545573";
  surface2 = "#3C3D53";
  surface1 = "#2A2C3B";
  surface0 = "#1E1F2A";
  base = "#14161D";
  mantle = "#0E0F15";
  crust = "#090A0F";
}

---@param cfg? cuddlefish.types.config
---@return cuddlefish.types.colors
function M.get_shades(cfg)
  cfg = cfg or require('cuddlefish.config').get()
  local shades = M.shades
  return shades
end

---@param cfg? cuddlefish.types.config
---@return cuddlefish.types.colors
function M.get(cfg)
  cfg = cfg or require('cuddlefish.config').get()
  local shades = M.get_shades(cfg)
  local colors = vim.tbl_extend('force', M.colors, shades)
  return vim.tbl_deep_extend('force', colors, cfg.color_overrides)
end

return M
