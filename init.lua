-- example file i.e lua/custom/init.lua

-- load your globals, autocmds here or anything .__.
-- json 格式化
vim.cmd [[ com! FormatJSON %!python3 -c "import json, sys, collections; print(json.dumps(json.load(sys.stdin, object_pairs_hook=collections.OrderedDict), ensure_ascii=False, indent=4))" ]]

-- 设置文件显示模式
vim.cmd [[
  autocmd Filetype python setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() expandtab tabstop=4 shiftwidth=4 softtabstop=4 nofoldenable
  autocmd Filetype markdown setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() noexpandtab tabstop=4 shiftwidth=4 softtabstop=4
  autocmd Filetype lua setlocal foldmethod=expr foldexpr=nvim_treesitter#foldexpr() expandtab tabstop=2 shiftwidth=2 softtabstop=2
  autocmd Filetype json setlocal foldmethod=indent
  autocmd Filetype yaml setlocal foldmethod=indent expandtab tabstop=2 shiftwidth=2 softtabstop=2 foldlevel=1
]]
