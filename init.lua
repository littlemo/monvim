-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.
-- json 格式化
vim.cmd [[ com! FormatJSON %!python3 -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=4))" ]]
