-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.
-- json 格式化
vim.cmd [[ com! FormatJSON %!python3 -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=4))" ]]

-- 配置光标行列配色
vim.cmd [[
  highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
  highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
]]
