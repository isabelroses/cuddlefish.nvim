local cache = {}

cache.dir = vim.fs.joinpath(vim.fn.stdpath 'cache', 'cuddlefish')

cache.path = {
  config = vim.fs.joinpath(cache.dir, 'config'),
  colors = vim.fs.joinpath(cache.dir, 'colors'),
}

cache.colors = {}

---@param cfg? cuddlefish.types.config
---@return string
function cache.cached_cfg(cfg)
  local git_path = vim.fs.joinpath(debug.getinfo(1).source:sub(2, -(#("/lua/cuddlefish/cache.lua"))) .. ".git", "HEAD")

  local git_ref = nil
  local git_file = io.open(git_path, 'rb')
  if not git_file then
    git_ref = 0
  else
    git_ref = git_file:read 'l'
    git_file:close()
  end

  cfg = cfg or require('cuddlefish.config').get()

  return git_ref .. tostring(require('cuddlefish.utils').hash(cfg))
end

---@param cfg? cuddlefish.types.config
---@return boolean
function cache.needs_compile(cfg)
  cfg = cfg or require('cuddlefish.config').get()

  local cached = nil
  local file = io.open(cache.path.config, 'rb')
  if not file then
    cached = 0
  else
    cached = file:read 'n'
    file:close()
  end

  local hash = cache.cached_cfg(cfg)

  return cached ~= hash
end

function cache.clear()
  cache.colors = {}
end

---@return string
function cache.fold()
  return [[
return string.dump(function()
vim.g.colors_name = "cuddlefish"
]] .. table.concat(cache.colors, '\n') .. [[
end, true)]]
end

---@param group string
---@param color vim.api.keyset.highlight
function cache.add(group, color)
  local line =
    string.format('vim.api.nvim_set_hl(0, %q, %s)', group, vim.inspect(color))
  table.insert(cache.colors, line)
end

---@param cfg? cuddlefish.types.config
---@return any? error
function cache.write(cfg)
  cfg = cfg or require('cuddlefish.config').get()

  if vim.fn.isdirectory(cache.dir) == 0 then
    vim.fn.mkdir(cache.dir, 'p')
  end

  local file = io.open(cache.path.config, 'wb')
  if not file then
    return error(string.format('could not open file: %s', cache.path.config))
  end
  file:write(cache.cached_cfg(cfg))
  file:close()

  file = io.open(cache.path.colors, 'w')
  if not file then
    return error(string.format('could not open file: %s', cache.path.colors))
  end

  local lines = cache.fold()
  file:write(lines)
  file:close()
end

--- load the cache file
--- -> string.dump(f)
--- load the string dumped function
--- -> f
--- load the highlights (f)
---
---@return any? error
function cache.load()
  local fn = loadfile(cache.path.colors)
  local lfile
  do
    ---@diagnostic disable-next-line: param-type-mismatch
    local ok, result = pcall(fn)
    if not ok then
      return error(string.format('error while loading cache: %s', result))
    end
    lfile = result
  end
  local lstr
  do
    local ok, result = pcall(loadstring, lfile)
    if not ok then
      return error(string.format('error while loading cache: %s', result))
    end
    lstr = result
  end
  do
    ---@diagnostic disable-next-line: param-type-mismatch
    local ok, result = pcall(lstr)
    if not ok then
      return error(string.format('error while loading cache: %s', result))
    end
  end
end

return cache
