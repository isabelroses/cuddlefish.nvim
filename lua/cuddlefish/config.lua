local M = {}

---@type cuddlefish.types.config
M.default = {
  theme = {
    variant = 'fall',
    accent = 'green',
  },
  editor = {
    transparent_background = false,
    override_terminal = true,
    sign = { color = 'none' },
    float = {
      color = 'mantle',
      invert_border = false,
    },
    completion = {
      color = 'surface0',
    },
  },
  style = {
    tabline = { 'reverse' },
    search = { 'italic', 'reverse' },
    incsearch = { 'italic', 'reverse' },
    types = { 'italic' },
    keyword = { 'italic' },
    comment = { 'italic' },
  },
  integrations = {
    semantic_tokens = true,
  },
  overrides = {},
  color_overrides = {},
}

---@type cuddlefish.types.config
---@diagnostic disable-next-line: missing-fields
M.config = {}

---@return cuddlefish.types.config
function M.get()
  return vim.tbl_deep_extend('force', M.default, M.config)
end

---@param cfg cuddlefish.types.config
---@return cuddlefish.types.config
function M.override(cfg)
  return vim.tbl_deep_extend('force', M.default, cfg)
end

---@param cfg cuddlefish.types.config
function M.set(cfg)
  M.config = cfg
end

return M
