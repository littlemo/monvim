local M = {}

M.setup = function()
  vim.cmd [[
    call wilder#setup({
          \   'modes': [':', '/', '?'],
          \   'next_key': '<TAB>',
          \   'previous_key': '<S-TAB>',
          \   'accept_key': '<C-e>',
          \   'reject_key': '<C-b>',
          \   'enable_cmdline_enter': 0,
          \ })

    call wilder#set_option('pipeline', [
          \   wilder#branch(
          \     wilder#python_file_finder_pipeline({
          \       'file_command': {_, arg -> stridx(arg, '.') != -1 ? ['fd', '-tf', '-H'] : ['fd', '-tf']},
          \       'dir_command': ['fd', '-td'],
          \       'filters': ['fuzzy_filter', 'difflib_sorter'],
          \     }),
          \     wilder#substitute_pipeline({
          \       'pipeline': wilder#python_search_pipeline({
          \         'skip_cmdtype_check': 1,
          \         'pattern': wilder#python_fuzzy_pattern({
          \           'start_at_boundary': 0,
          \         }),
          \         'sorter': wilder#python_difflib_sorter(),
          \         'engine': 're',
          \       }),
          \     }),
          \     wilder#cmdline_pipeline({
          \       'fuzzy': 1,
          \       'set_pcre2_pattern': 1,
          \     }),
          \     [
          \       wilder#check({_, x -> empty(x)}),
          \       wilder#history(),
          \     ],
          \     wilder#vim_search_pipeline(),
          \   ),
          \ ])

    let s:highlighters = wilder#highlighter_with_gradient([
          \ wilder#pcre2_highlighter(),
          \ ])

    let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
          \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
          \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
          \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b']
    let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
          \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
          \ )})

    let s:popupmenu_renderer = wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
          \ 'pumblend': 20,
          \ 'border': 'rounded',
          \ 'empty_message': wilder#popupmenu_empty_message_with_spinner(),
          \ 'highlights': {
          \   'gradient': s:gradient,
          \ },
          \ 'highlighter': s:highlighters,
          \ 'left': [
          \   ' ',
          \   wilder#popupmenu_devicons(),
          \   wilder#popupmenu_buffer_flags({
          \     'flags': ' a + ',
          \     'icons': {'+': '', 'a': '', 'h': ''},
          \   }),
          \ ],
          \ 'right': [
          \   ' ',
          \   wilder#popupmenu_scrollbar(),
          \ ],
          \ }))

    let s:wildmenu_renderer = wilder#wildmenu_renderer({
          \ 'highlighter': s:highlighters,
          \ 'separator': ' · ',
          \ 'left': [' ', wilder#wildmenu_spinner(), ' '],
          \ 'right': [' ', wilder#wildmenu_index()],
          \ })

    call wilder#set_option('renderer', wilder#renderer_mux({
          \ ':': s:popupmenu_renderer,
          \ '/': s:wildmenu_renderer,
          \ 'substitute': s:wildmenu_renderer,
          \ }))
  ]]
end

return M
