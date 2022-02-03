local present, gitsigns = pcall(require, "gitsigns")

if not present then
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "DiffAdd", text = "│", numhl = "GitSignsAddNr" },
    change = { hl = "DiffChange", text = "│", numhl = "GitSignsChangeNr" },
    delete = { hl = "DiffDelete", text = "", numhl = "GitSignsDeleteNr" },
    topdelete = { hl = "DiffDelete", text = "‾", numhl = "GitSignsDeleteNr" },
    changedelete = { hl = "DiffChangeDelete", text = "~", numhl = "GitSignsChangeNr" },
  },
  word_diff = true,
  current_line_blame = true,
  current_line_blame_opts = {
    delay = 200,
    ignore_whitespace = true,
  },
}


-- 默认按键映射参考
-- -- Navigation
-- map('n', ']c', "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", {expr=true})
-- map('n', '[c', "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", {expr=true})
--
-- -- Actions
-- map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
-- map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
-- map('n', '<leader>hS', gs.stage_buffer)
-- map('n', '<leader>hu', gs.undo_stage_hunk)
-- map('n', '<leader>hR', gs.reset_buffer)
-- map('n', '<leader>hp', gs.preview_hunk)
-- map('n', '<leader>hb', function() gs.blame_line{full=true} end)
-- map('n', '<leader>tb', gs.toggle_current_line_blame)
-- map('n', '<leader>hd', gs.diffthis)
-- map('n', '<leader>hD', function() gs.diffthis('~') end)
-- map('n', '<leader>td', gs.toggle_deleted)
--
-- -- Text object
-- map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
