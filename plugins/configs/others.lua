local M = {}

M.lastplace = function ()
  vim.cmd [[
    let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
    let g:lastplace_ignore_buftype = "quickfix,nofile,help"
    let g:lastplace_open_folds = 0
  ]]
end

M.crosshairs = function ()
  vim.cmd [[
    set cursorline    " enable the horizontal line
    set cursorcolumn  " enable the vertical line
    highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
    highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
  ]]
end

M.prettyfold = function ()
  local present, prettyfold = pcall(require, "pretty-fold")

  if not present then
    return
  end

  local options = {
    keep_indentation = false,
    fill_char = '•',
    sections = {
      left = {
        '━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣━'
      },
      right = {
        '━┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
      }
    }
  }

  prettyfold.setup(options)
  require('pretty-fold.preview').setup({
    border = 'rounded',
  })
end

return M
