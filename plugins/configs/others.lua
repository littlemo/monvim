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

    " 下方光标行列高亮配色设置已在 NvChad 自定义配置层面设置，此处仅留作归档记录
    " highlight CursorLine   cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
    " highlight CursorColumn cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=NONE
  ]]
end

M.cursorword = function ()
  vim.cmd [[
    " disable highlighting for some filetypes
    let g:cursorword_disable_filetypes = []

    " min width of word
    let g:cursorword_min_width = 3

    " max width of word
    let g:cursorword_max_width = 50

    hi default CursorWord cterm=underline gui=underline
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
