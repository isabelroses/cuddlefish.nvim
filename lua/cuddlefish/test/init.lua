---@diagnostic disable: redefined-local

local M = {}

M.reload = function()
  local ok, plenary = pcall(require, 'plenary.reload')

  if not ok then
    return
  end

  plenary.reload_module 'cuddlefish'
  plenary.reload_module('lualine.themes.cuddlefish', true)
end

M.run = function(testname)
  M.reload()

  testname = testname or 'setup'
  local ok, result =
    pcall(require, string.format('cuddlefish.test.%s', testname))
  if not ok then
    error(
      string.format('error while running test (%s):\n\t%s', testname, result)
    )
  end

  M.fixup()
end

M.fixup = function()
  local ok, lualine = pcall(require, 'lualine')
  if ok then
    lualine.setup {}
  end
  -- local ok, ibl = pcall(require, 'ibl')
  -- if ok then
  --   ibl.initialized = false
  --   ibl.setup(require('ibl.config').config)
  -- end

  vim.api.nvim_exec_autocmds('ColorScheme', {})
end

M.hotreload = function(testname)
  vim.api.nvim_create_autocmd('BufWritePost', {
    pattern = 'lua/cuddlefish/*.lua',
    group = vim.api.nvim_create_augroup(
      'cuddlefish:hotreload',
      { clear = true }
    ),
    callback = function()
      M.run(testname)
    end,
  })
end

return M
