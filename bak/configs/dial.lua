local dial = require('dial')

local M = {}

M.config = function()
  local extra_augends = {
    "markup#markdown#header",
    "date#[%H:%M:%S]",
  }
  local custom_augends = {
    boolean = dial.common.enum_cyclic({ strlist = { "true", "false" } }),
    Boolean = dial.common.enum_cyclic({ strlist = { "True", "False" } }),
    on = dial.common.enum_cyclic({ strlist = { "on", "off" } }),
    ON = dial.common.enum_cyclic({ strlist = { "ON", "OFF" } }),
    On = dial.common.enum_cyclic({ strlist = { "On", "Off" } }),
    -- direction = dial.common.enum_cyclic({ strlist = { "north", "south", "west", "east" } }),
    -- Direction = dial.common.enum_cyclic({ strlist = { "North", "South", "West", "East" } }),
    greater = dial.common.enum_cyclic({ strlist = { ">", "<" } }),
    equal = dial.common.enum_cyclic({ strlist = { "==", "!=" } }),
    Equal = dial.common.enum_cyclic({ strlist = { "===", "!==" } }),
    greaterEqual = dial.common.enum_cyclic({ strlist = { ">=", "<=" } }),
    selfAdd = dial.common.enum_cyclic({ strlist = { "+=", "-=" } }),
  }

  -- register custom augends
  for k, v in pairs(custom_augends) do
    local augend_name = "custom#" .. k
    dial.augends[augend_name] = v
    table.insert(extra_augends, augend_name)
  end

  -- extend capabilities
  vim.list_extend(dial.config.searchlist.normal, extra_augends)
  vim.list_extend(dial.config.searchlist.visual, extra_augends)

  
  vim.api.nvim_set_keymap('n', '<C-a>', '<Plug>(dial-increment)', {})
  vim.api.nvim_set_keymap('v', '<C-a>', '<Plug>(dial-increment)', {})
  vim.api.nvim_set_keymap('v', 'g<C-a>', '<Plug>(dial-increment-additional)', {})
  vim.api.nvim_set_keymap('n', '<C-x>', '<Plug>(dial-decrement)', {})
  vim.api.nvim_set_keymap('v', '<C-x>', '<Plug>(dial-decrement)', {})
  vim.api.nvim_set_keymap('v', 'g<C-x>', '<Plug>(dial-decrement-additional)', {})

  -- vim.cmd [[
  --   nmap <C-a> <Plug>(dial-increment)
  --   nmap <C-x> <Plug>(dial-decrement)
  --   vmap <C-a> <Plug>(dial-increment)
  --   vmap <C-x> <Plug>(dial-decrement)
  --   vmap g<C-a> <Plug>(dial-increment-additional)
  --   vmap g<C-x> <Plug>(dial-decrement-additional)
  -- ]]
end

return M
