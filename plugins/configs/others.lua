local M = {}

M.lastplace = function ()
  local present, lastplace = pcall(require, "nvim-lastplace")

  if not present then
     return
  end

  local options = {
    lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
    lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
    lastplace_open_folds = true
  }

  lastplace.setup(options)
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
