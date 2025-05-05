---@alias cuddlefish.types.variant 'winter'|'fall'|'spring'|'summer'

---@class cuddlefish.types.config
---@field theme cuddlefish.types.config.theme
---@field editor cuddlefish.types.config.editor
---@field cache? boolean
---@field style? cuddlefish.types.styleconfig
---@field integrations? cuddlefish.types.config.integrations
---@field color_overrides? cuddlefish.types.colors
---@field overrides? cuddlefish.types.hlgroups|fun(colors: cuddlefish.types.colors): cuddlefish.types.hlgroups

---@class cuddlefish.types.config.theme
---@field variant? cuddlefish.types.variant
---@field accent? cuddlefish.types.colors.enum

---@class cuddlefish.types.config.editor
---@field transparent_background? boolean
---@field override_terminal? boolean
---@field sign? { color: cuddlefish.types.colors.enum|'none' }
---@field float? { color: cuddlefish.types.colors.enum|'none', invert_border: boolean }
---@field completion? { color: cuddlefish.types.colors.enum|'none' }

---@class cuddlefish.types.config.integrations
---@field blink_cmp? boolean Saghen/blink.cmp
---@field cmp? boolean hrsh7th/nvim-cmp
---@field fzf_lua? boolean ibhagwan/fzf-lua
---@field gitsigns? boolean lewis6991/gitsigns.nvim
---@field indent_blankline? { enable: boolean, scope_color: cuddlefish.types.colors.enum } lukas-reineke/indent-blankline.nvim
---@field mini? cuddlefish.types.config.integrations.mini echasnovski/mini.nvim
---@field neotree? boolean nvim-neo-tree/neo-tree.nvim
---@field nvimtree? boolean nvim-tree/nvim-tree.lua
---@field rainbow_delimiters? boolean hiphish/rainbow-delimiters.nvim
---@field semantic_tokens? boolean
---@field symbols_outline? boolean simrat39/symbols-outline.nvim
---@field telescope? boolean nvim-telescope/telescope.nvim
---@field which_key? boolean folke/which-key.nvim

---@class cuddlefish.types.config.integrations.mini
---@field enable boolean
---@field animate boolean
---@field clue boolean
---@field completion boolean
---@field cursorword boolean
---@field deps boolean
---@field diff boolean
---@field files boolean
---@field hipatterns boolean
---@field icons boolean
---@field indentscope boolean
---@field jump boolean
---@field jump2d boolean
---@field map boolean
---@field notify boolean
---@field operators boolean
---@field pick boolean
---@field starters boolean
---@field statusline boolean
---@field surround boolean
---@field tabline boolean
---@field test boolean
---@field trailspace boolean

---@alias cuddlefish.types.colors.enum 'crust'|'softbase'|'mantle'|'base'|'surface0'|'surface1'|'surface2'|'overlay0'|'overlay1'|'overlay2'|'subtext0'|'subtext1'|'text'|'red'|'orange'|'yellow'|'lime'|'green'|'aqua'|'snow'|'blue'|'skye'|'purple'|'violet'|'pink'|'cherry'
---@alias cuddlefish.types.colors { [cuddlefish.types.colors.enum]: string }

---@class cuddlefish.types.colorspec
---@field fg? string
---@field bg? string
---@field link? string
---@field blend? integer
---@field style? cuddlefish.types.styleopt
---@field [1]? string
---@field [2]? string

---@alias cuddlefish.types.styleopt cuddlefish.types.styleopt.enum[]
---@alias cuddlefish.types.styleopt.enum 'bold'|'standout'|'underline'|'undercurl'|'underdouble'|'underdotted'|'underdashed'|'strikethrough'|'italic'|'reverse'|'nocombine'

---@alias cuddlefish.types.hlgroups { [string]: cuddlefish.types.colorspec }
---@alias cuddlefish.types.hlgroups.OL { [integer]: cuddlefish.types.hlgroups.OL, [string]: cuddlefish.types.colorspec }
