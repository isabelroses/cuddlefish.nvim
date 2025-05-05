local M = {}

---@type cuddlefish.types.config
M.default = {
  theme = {
    variant = 'fall',
    accent = 'pink',
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
    blink_cmp = true,
    cmp = true,
    gitsigns = true,
    indent_blankline = {
      scope_color = 'pink',
      enable = true,
    },
    mini = {
      enable = true,
      animate = true,
      clue = true,
      completion = true,
      cursorword = true,
      deps = true,
      diff = true,
      files = true,
      hipatterns = true,
      icons = true,
      indentscope = true,
      jump = true,
      jump2d = true,
      map = true,
      notify = true,
      operators = true,
      pick = true,
      starters = true,
      statusline = true,
      surround = true,
      tabline = true,
      test = true,
      trailspace = true,
    },
    neotree = true,
    nvimtree = true,
    rainbow_delimiters = true,
    semantic_tokens = true,
    which_key = true,
  },
  overrides = {},
  color_overrides = {},
  cache = true,
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
