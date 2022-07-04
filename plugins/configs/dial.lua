local present, dial = pcall(require, "dial")

if not present then
   return
end

local autocmd = vim.api.nvim_create_autocmd
local merge_tb = vim.tbl_deep_extend
local set_keymap = vim.api.nvim_set_keymap
local buf_set_keymap = vim.api.nvim_buf_set_keymap
local keymap_opts = {noremap = true}
local augend = require("dial.augend")
local dial_map = require("dial.map")

local group = {
  default = {
    augend.date.alias["%Y-%m-%d"],
    augend.date.alias["%H:%M:%S"],

    -- https://github.com/monaqa/dial.nvim#constant
    augend.constant.new{ elements = {"true", "false"}, word = true, cyclic = true, },
    augend.constant.new{ elements = {"True", "False"}, word = true, cyclic = true, },
    augend.constant.new{ elements = {"on", "off"},     word = true, cyclic = true, },
    augend.constant.new{ elements = {"ON", "OFF"},     word = true, cyclic = true, },
    augend.constant.new{ elements = {"On", "Off"},     word = true, cyclic = true, },
    augend.constant.new{ elements = {">", "<"},        word = true, cyclic = true, },
    augend.constant.new{ elements = {"==", "!="},      word = true, cyclic = true, },
    augend.constant.new{ elements = {"===", "!=="},    word = true, cyclic = true, },
    augend.constant.new{ elements = {">=", "<="},      word = true, cyclic = true, },
    augend.constant.new{ elements = {"+=", "-="},      word = true, cyclic = true, },
  },
}
local extra = {
  markdown = {
    augend.misc.alias.markdown_header,
  },
}
group = merge_tb("force", group, extra)

require("dial.config").augends:register_group(group)

set_keymap("n", "<C-a>",  dial_map.inc_normal(),  keymap_opts)
set_keymap("n", "<C-x>",  dial_map.dec_normal(),  keymap_opts)
set_keymap("v", "<C-a>",  dial_map.inc_visual(),  keymap_opts)
set_keymap("v", "<C-x>",  dial_map.dec_visual(),  keymap_opts)
set_keymap("v", "g<C-a>", dial_map.inc_gvisual(), keymap_opts)
set_keymap("v", "g<C-x>", dial_map.dec_gvisual(), keymap_opts)

for ft, _ in pairs(extra) do
  autocmd("FileType", {
    pattern = ft,
    callback = function ()
      buf_set_keymap(0, "n", "<C-a>",  dial_map.inc_normal(ft),  keymap_opts)
      buf_set_keymap(0, "n", "<C-x>",  dial_map.dec_normal(ft),  keymap_opts)
      buf_set_keymap(0, "v", "<C-a>",  dial_map.inc_visual(ft),  keymap_opts)
      buf_set_keymap(0, "v", "<C-x>",  dial_map.dec_visual(ft),  keymap_opts)
      buf_set_keymap(0, "v", "g<C-a>", dial_map.inc_gvisual(ft), keymap_opts)
      buf_set_keymap(0, "v", "g<C-x>", dial_map.dec_gvisual(ft), keymap_opts)
    end
  })
end
