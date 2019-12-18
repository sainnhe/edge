" -----------------------------------------------------------------------------
" Name:         Edge
" Description:  Clean & Elegant Color Scheme for Vim
" Author:       Sainnhepark <sainnhe@gmail.com>
" Website:      https://github.com/sainnhe/edge/
" License:      MIT && Anti-996
" -----------------------------------------------------------------------------

" Initialization{{{
highlight clear
if exists('syntax_on')
  syntax reset
endif

let s:t_Co = exists('&t_Co') && !empty(&t_Co) && &t_Co > 1 ? &t_Co : 2

let g:colors_name = 'edge'
" }}}
" Configuration{{{
let s:configuration = {}
let s:configuration.style = get(g:, 'edge_style', 'default')
let s:configuration.transparent_background = get(g:, 'edge_transparent_background', 0)
let s:configuration.popup_menu_selection_background = get(g:, 'edge_popup_menu_selection_background', 'blue')
let s:configuration.disable_italic_comment = get(g:, 'edge_disable_italic_comment', 0)
let s:configuration.current_word = get(g:, 'edge_current_word', get(g:, 'edge_transparent_background', 0) == 0 ? 'grey background' : 'bold')
" }}}
" Palette{{{
if s:configuration.style ==# 'default'
  if &background ==# 'dark'
    let s:palette = {
          \ 'bg0':        ['#262729',   '235',  'Black'],
          \ 'bg1':        ['#292b30',   '236',  'DarkGrey'],
          \ 'bg2':        ['#2c2e34',   '236',  'DarkGrey'],
          \ 'bg3':        ['#34363f',   '237',  'DarkGrey'],
          \ 'bg4':        ['#363944',   '237',  'Grey'],
          \ 'bg5':        ['#3b3e48',   '238',  'Grey'],
          \ 'bg_grey':    ['#828a98',   '246',  'LightGrey'],
          \ 'bg_red':     ['#f07e7e',   '203',  'Red'],
          \ 'bg_red1':    ['#473536',   '52',   'DarkRed'],
          \ 'bg_red2':    ['#573c3d',   '52',   'DarkRed'],
          \ 'bg_green':   ['#a2be8a',   '107',  'Green'],
          \ 'bg_green1':  ['#384034',   '22',   'DarkGreen'],
          \ 'bg_green2':  ['#424c3b',   '22',   'DarkGreen'],
          \ 'bg_blue':    ['#72b1e5',   '110',  'Blue'],
          \ 'bg_blue1':   ['#323e47',   '17',   'DarkBlue'],
          \ 'bg_blue2':   ['#394957',   '17',   'DarkBlue'],
          \ 'bg_purple':  ['#d898eb',   '176',  'Magenta'],
          \ 'bg_purple1': ['#433948',   '54',   'DarkMagenta'],
          \ 'bg_purple2': ['#514359',   '54',   'DarkMagenta'],
          \ 'fg':         ['#bcc4d1',   '250',  'White'],
          \ 'red':        ['#f07e7e',   '203',  'Red'],
          \ 'yellow':     ['#d1b277',   '179',  'Yellow'],
          \ 'green':      ['#a3bc8d',   '107',  'Green'],
          \ 'cyan':       ['#78b7b1',   '72',   'Cyan'],
          \ 'blue':       ['#7ab3e1',   '110',  'Blue'],
          \ 'purple':     ['#d898eb',   '176',  'Magenta'],
          \ 'grey':       ['#88909f',   '246',  'LightGrey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  else
    let s:palette = {
          \ 'bg0':        ['#fafafa',   '231',  'White'],
          \ 'bg1':        ['#f1f4f6',   '255',  'LightGrey'],
          \ 'bg2':        ['#eef1f4',   '255',  'LightGrey'],
          \ 'bg3':        ['#e8ebf0',   '254',  'LightGrey'],
          \ 'bg4':        ['#e8ebf0',   '253',  'Grey'],
          \ 'bg5':        ['#dde2e7',   '253',  'Grey'],
          \ 'bg_grey':    ['#bcc5cf',   '246',  'DarkGrey'],
          \ 'bg_red':     ['#e17373',   '167',  'Red'],
          \ 'bg_red1':    ['#f6e4e4',   '217',  'LightRed'],
          \ 'bg_red2':    ['#f4dada',   '217',  'LightRed'],
          \ 'bg_green':   ['#76af6f',   '107',  'Green'],
          \ 'bg_green1':  ['#e5eee4',   '150',  'LightGreen'],
          \ 'bg_green2':  ['#dae9d8',   '150',  'LightGreen'],
          \ 'bg_blue':    ['#6996e0',   '68',   'Blue'],
          \ 'bg_blue1':   ['#e3eaf6',   '153',  'LightBlue'],
          \ 'bg_blue2':   ['#d6e1f4',   '153',  'LightBlue'],
          \ 'bg_purple':  ['#bf75d6',   '134',  'Magenta'],
          \ 'bg_purple1': ['#f1e5f5',   '183',  'LightMagenta'],
          \ 'bg_purple2': ['#eddaf2',   '183',  'LightMagenta'],
          \ 'fg':         ['#4b505b',   '240',  'Black'],
          \ 'red':        ['#d15f5f',   '167',  'Red'],
          \ 'yellow':     ['#be7e05',   '172',  'Yellow'],
          \ 'green':      ['#608e32',   '107',  'Green'],
          \ 'cyan':       ['#3a8b84',   '73',   'Cyan'],
          \ 'blue':       ['#5079be',   '68',   'Blue'],
          \ 'purple':     ['#b05ccc',   '134',  'Magenta'],
          \ 'grey':       ['#949ba5',   '245',  'Grey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  endif
elseif s:configuration.style ==# 'neon'
  if &background ==# 'dark'
    let s:palette = {
          \ 'bg0':        ['#23252e',   '235',  'Black'],
          \ 'bg1':        ['#272935',   '236',  'DarkGrey'],
          \ 'bg2':        ['#2b2d3a',   '236',  'DarkGrey'],
          \ 'bg3':        ['#333749',   '237',  'DarkGrey'],
          \ 'bg4':        ['#363a4e',   '237',  'Grey'],
          \ 'bg5':        ['#393e53',   '238',  'Grey'],
          \ 'bg_grey':    ['#7a819d',   '246',  'LightGrey'],
          \ 'bg_red':     ['#f07e7e',   '203',  'Red'],
          \ 'bg_red1':    ['#473536',   '52',   'DarkRed'],
          \ 'bg_red2':    ['#573c3d',   '52',   'DarkRed'],
          \ 'bg_green':   ['#a2be8a',   '107',  'Green'],
          \ 'bg_green1':  ['#384034',   '22',   'DarkGreen'],
          \ 'bg_green2':  ['#424c3b',   '22',   'DarkGreen'],
          \ 'bg_blue':    ['#7eb4e7',   '110',  'Blue'],
          \ 'bg_blue1':   ['#323e47',   '17',   'DarkBlue'],
          \ 'bg_blue2':   ['#394957',   '17',   'DarkBlue'],
          \ 'bg_purple':  ['#d898eb',   '176',  'Magenta'],
          \ 'bg_purple1': ['#433948',   '54',   'DarkMagenta'],
          \ 'bg_purple2': ['#514359',   '54',   'DarkMagenta'],
          \ 'fg':         ['#bcc3d2',   '250',  'White'],
          \ 'red':        ['#f07e7e',   '203',  'Red'],
          \ 'yellow':     ['#d0b073',   '179',  'Yellow'],
          \ 'green':      ['#a4be8e',   '107',  'Green'],
          \ 'cyan':       ['#7bbbb5',   '72',   'Cyan'],
          \ 'blue':       ['#7eb4e7',   '110',  'Blue'],
          \ 'purple':     ['#d898eb',   '176',  'Magenta'],
          \ 'grey':       ['#88909f',   '246',  'LightGrey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  else
    let s:palette = {
          \ 'bg0':        ['#fafafa',   '231',  'White'],
          \ 'bg1':        ['#f1f5f7',   '255',  'LightGrey'],
          \ 'bg2':        ['#eef2f6',   '255',  'LightGrey'],
          \ 'bg3':        ['#e7ecf1',   '254',  'LightGrey'],
          \ 'bg4':        ['#e5eaf0',   '253',  'Grey'],
          \ 'bg5':        ['#dde4ea',   '253',  'Grey'],
          \ 'bg_grey':    ['#bbc7d3',   '246',  'DarkGrey'],
          \ 'bg_red':     ['#e17373',   '167',  'Red'],
          \ 'bg_red1':    ['#f6e4e4',   '217',  'LightRed'],
          \ 'bg_red2':    ['#f4dada',   '217',  'LightRed'],
          \ 'bg_green':   ['#76af6f',   '107',  'Green'],
          \ 'bg_green1':  ['#e5eee4',   '150',  'LightGreen'],
          \ 'bg_green2':  ['#dae9d8',   '150',  'LightGreen'],
          \ 'bg_blue':    ['#6996e0',   '68',   'Blue'],
          \ 'bg_blue1':   ['#e3eaf6',   '153',  'LightBlue'],
          \ 'bg_blue2':   ['#d6e1f4',   '153',  'LightBlue'],
          \ 'bg_purple':  ['#bf75d6',   '134',  'Magenta'],
          \ 'bg_purple1': ['#f1e5f5',   '183',  'LightMagenta'],
          \ 'bg_purple2': ['#eddaf2',   '183',  'LightMagenta'],
          \ 'fg':         ['#4b505b',   '240',  'Black'],
          \ 'red':        ['#d15f5f',   '167',  'Red'],
          \ 'yellow':     ['#be7e05',   '172',  'Yellow'],
          \ 'green':      ['#608e32',   '107',  'Green'],
          \ 'cyan':       ['#3a8b84',   '73',   'Cyan'],
          \ 'blue':       ['#5079be',   '68',   'Blue'],
          \ 'purple':     ['#b05ccc',   '134',  'Magenta'],
          \ 'grey':       ['#949ba5',   '245',  'Grey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  endif
endif
" }}}
" Function{{{
" call s:HL(group, foreground, background)
" call s:HL(group, foreground, background, gui, guisp)
"
" E.g.:
" call s:HL('Normal', s:palette.fg, s:palette.bg0)

if (has('termguicolors') && &termguicolors) || has('gui_running')  " guifg guibg gui cterm guisp
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'guifg=' . a:fg[0],
          \ 'guibg=' . a:bg[0],
          \ ]
    if a:0 >= 1
      call add(hl_string, 'gui=' . a:1)
      call add(hl_string, 'cterm=' . a:1)
    else
      call add(hl_string, 'gui=NONE')
      call add(hl_string, 'cterm=NONE')
    endif
    if a:0 >= 2
      call add(hl_string, 'guisp=' . a:2[0])
    endif
    execute join(hl_string, ' ')
  endfunction
elseif s:t_Co >= 256  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[1],
          \ 'ctermbg=' . a:bg[1],
          \ ]
    if a:0 >= 1
      call add(hl_string, 'cterm=' . a:1)
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
else  " ctermfg ctermbg cterm
  function! s:HL(group, fg, bg, ...)
    let hl_string = [
          \ 'highlight', a:group,
          \ 'ctermfg=' . a:fg[2],
          \ 'ctermbg=' . a:bg[2],
          \ ]
    if a:0 >= 1
      call add(hl_string, 'cterm=' . a:1)
    else
      call add(hl_string, 'cterm=NONE')
    endif
    execute join(hl_string, ' ')
  endfunction
endif
" }}}

" Common Highlight Groups{{{
if s:configuration.transparent_background
  call s:HL('Normal', s:palette.fg, s:palette.none)
  call s:HL('Terminal', s:palette.fg, s:palette.none)
  call s:HL('EndOfBuffer', s:palette.bg0, s:palette.none)
  call s:HL('FoldColumn', s:palette.grey, s:palette.none)
  call s:HL('Folded', s:palette.grey, s:palette.none)
  call s:HL('SignColumn', s:palette.fg, s:palette.none)
else
  call s:HL('Normal', s:palette.fg, s:palette.bg0)
  call s:HL('Terminal', s:palette.fg, s:palette.bg0)
  call s:HL('EndOfBuffer', s:palette.bg0, s:palette.bg0)
  call s:HL('FoldColumn', s:palette.grey, s:palette.bg2)
  call s:HL('Folded', s:palette.grey, s:palette.bg2)
  call s:HL('SignColumn', s:palette.fg, s:palette.bg2)
endif
call s:HL('ColorColumn', s:palette.none, s:palette.bg2)
call s:HL('Conceal', s:palette.grey, s:palette.none)
call s:HL('Cursor', s:palette.none, s:palette.none, 'reverse')
call s:HL('lCursor', s:palette.none, s:palette.none, 'reverse')
call s:HL('CursorColumn', s:palette.none, s:palette.bg1)
call s:HL('CursorLine', s:palette.none, s:palette.bg1)
call s:HL('LineNr', s:palette.grey, s:palette.none)
if &relativenumber == 1 && &cursorline == 0
  call s:HL('CursorLineNr', s:palette.fg, s:palette.none)
else
  call s:HL('CursorLineNr', s:palette.fg, s:palette.bg1)
endif
call s:HL('DiffAdd', s:palette.none, s:palette.bg_green1)
call s:HL('DiffChange', s:palette.none, s:palette.bg_blue1)
call s:HL('DiffDelete', s:palette.none, s:palette.bg_red1)
call s:HL('DiffText', s:palette.none, s:palette.none, 'reverse')
call s:HL('Directory', s:palette.green, s:palette.none)
call s:HL('ErrorMsg', s:palette.red, s:palette.none, 'bold,underline')
call s:HL('WarningMsg', s:palette.yellow, s:palette.none, 'bold')
call s:HL('ModeMsg', s:palette.fg, s:palette.none, 'bold')
call s:HL('MoreMsg', s:palette.blue, s:palette.none, 'bold')
call s:HL('IncSearch', s:palette.none, s:palette.bg_red2, 'bold,underline')
call s:HL('Search', s:palette.none, s:palette.bg4)
call s:HL('MatchParen', s:palette.none, s:palette.bg5)
call s:HL('NonText', s:palette.grey, s:palette.none)
call s:HL('Pmenu', s:palette.fg, s:palette.bg3)
call s:HL('PmenuSbar', s:palette.none, s:palette.bg3)
if s:configuration.popup_menu_selection_background ==# 'blue'
  call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_blue)
  call s:HL('WildMenu', s:palette.bg0, s:palette.bg_blue)
elseif s:configuration.popup_menu_selection_background ==# 'green'
  call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_green)
  call s:HL('WildMenu', s:palette.bg0, s:palette.bg_green)
elseif s:configuration.popup_menu_selection_background ==# 'purple'
  call s:HL('PmenuSel', s:palette.bg0, s:palette.bg_purple)
  call s:HL('WildMenu', s:palette.bg0, s:palette.bg_purple)
endif
call s:HL('PmenuThumb', s:palette.none, s:palette.bg_grey)
call s:HL('Question', s:palette.yellow, s:palette.none)
call s:HL('SpellBad', s:palette.red, s:palette.none, 'undercurl', s:palette.red)
call s:HL('SpellCap', s:palette.yellow, s:palette.none, 'undercurl', s:palette.yellow)
call s:HL('SpellLocal', s:palette.blue, s:palette.none, 'undercurl', s:palette.blue)
call s:HL('SpellRare', s:palette.purple, s:palette.none, 'undercurl', s:palette.purple)
call s:HL('StatusLine', s:palette.fg, s:palette.bg5)
call s:HL('StatusLineTerm', s:palette.fg, s:palette.bg5)
call s:HL('StatusLineNC', s:palette.grey, s:palette.bg2)
call s:HL('StatusLineTermNC', s:palette.grey, s:palette.bg2)
call s:HL('TabLine', s:palette.fg, s:palette.bg5)
call s:HL('TabLineFill', s:palette.grey, s:palette.bg2)
call s:HL('TabLineSel', s:palette.bg0, s:palette.bg_purple)
call s:HL('VertSplit', s:palette.bg5, s:palette.none)
call s:HL('Visual', s:palette.none, s:palette.bg4)
call s:HL('VisualNOS', s:palette.none, s:palette.bg4, 'italic')
call s:HL('CursorIM', s:palette.none, s:palette.fg)
call s:HL('ToolbarLine', s:palette.none, s:palette.grey)
call s:HL('ToolbarButton', s:palette.fg, s:palette.bg0, 'bold')
call s:HL('QuickFixLine', s:palette.blue, s:palette.bg2)
call s:HL('Debug', s:palette.yellow, s:palette.none)
call s:HL('PreProc', s:palette.red, s:palette.none)
call s:HL('Include', s:palette.red, s:palette.none)
call s:HL('Macro', s:palette.red, s:palette.none)
call s:HL('Error', s:palette.red, s:palette.none)
call s:HL('Keyword', s:palette.red, s:palette.none)
call s:HL('Define', s:palette.red, s:palette.none)
call s:HL('Typedef', s:palette.red, s:palette.none)
call s:HL('Exception', s:palette.red, s:palette.none)
call s:HL('Label', s:palette.red, s:palette.none)
call s:HL('Special', s:palette.yellow, s:palette.none)
call s:HL('SpecialChar', s:palette.yellow, s:palette.none)
call s:HL('Type', s:palette.yellow, s:palette.none)
call s:HL('Structure', s:palette.yellow, s:palette.none)
call s:HL('Boolean', s:palette.green, s:palette.none)
call s:HL('String', s:palette.green, s:palette.none)
call s:HL('Character', s:palette.green, s:palette.none)
call s:HL('Number', s:palette.green, s:palette.none)
call s:HL('Float', s:palette.green, s:palette.none)
call s:HL('Identifier', s:palette.cyan, s:palette.none)
call s:HL('Constant', s:palette.cyan, s:palette.none)
call s:HL('Function', s:palette.blue, s:palette.none)
call s:HL('Operator', s:palette.blue, s:palette.none)
call s:HL('SpecialKey', s:palette.blue, s:palette.none)
call s:HL('Title', s:palette.purple, s:palette.none, 'bold')
call s:HL('Conditional', s:palette.purple, s:palette.none)
call s:HL('PreCondit', s:palette.purple, s:palette.none)
call s:HL('Repeat', s:palette.purple, s:palette.none)
call s:HL('StorageClass', s:palette.purple, s:palette.none)
call s:HL('Statement', s:palette.purple, s:palette.none)
call s:HL('Tag', s:palette.purple, s:palette.none)
call s:HL('Delimiter', s:palette.fg, s:palette.none)
if s:configuration.disable_italic_comment
  call s:HL('Comment', s:palette.grey, s:palette.none)
  call s:HL('SpecialComment', s:palette.grey, s:palette.none)
  call s:HL('Todo', s:palette.purple, s:palette.none)
else
  call s:HL('Comment', s:palette.grey, s:palette.none, 'italic')
  call s:HL('SpecialComment', s:palette.grey, s:palette.none, 'italic')
  call s:HL('Todo', s:palette.purple, s:palette.none, 'italic')
endif
call s:HL('Ignore', s:palette.grey, s:palette.none)
call s:HL('Underlined', s:palette.none, s:palette.none, 'underline')
" }}}
" Terminal{{{
if (has('termguicolors') && &termguicolors) || has('gui_running')
  " Definition
  let s:terminal = {
        \ 'black':    s:palette.fg,
        \ 'red':      s:palette.red,
        \ 'yellow':   s:palette.yellow,
        \ 'green':    s:palette.green,
        \ 'cyan':     s:palette.cyan,
        \ 'blue':     s:palette.blue,
        \ 'purple':   s:palette.purple,
        \ 'white':    s:palette.grey
        \ }
  " Implementation{{{
  if !has('nvim')
    let g:terminal_ansi_colors = [s:terminal.black[0], s:terminal.red[0], s:terminal.green[0], s:terminal.yellow[0],
          \ s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0], s:terminal.black[0], s:terminal.red[0],
          \ s:terminal.green[0], s:terminal.yellow[0], s:terminal.blue[0], s:terminal.purple[0], s:terminal.cyan[0], s:terminal.white[0]]
  else
    let g:terminal_color_0 = s:terminal.black[0]
    let g:terminal_color_1 = s:terminal.red[0]
    let g:terminal_color_2 = s:terminal.green[0]
    let g:terminal_color_3 = s:terminal.yellow[0]
    let g:terminal_color_4 = s:terminal.blue[0]
    let g:terminal_color_5 = s:terminal.purple[0]
    let g:terminal_color_6 = s:terminal.cyan[0]
    let g:terminal_color_7 = s:terminal.white[0]
    let g:terminal_color_8 = s:terminal.black[0]
    let g:terminal_color_9 = s:terminal.red[0]
    let g:terminal_color_10 = s:terminal.green[0]
    let g:terminal_color_11 = s:terminal.yellow[0]
    let g:terminal_color_12 = s:terminal.blue[0]
    let g:terminal_color_13 = s:terminal.purple[0]
    let g:terminal_color_14 = s:terminal.cyan[0]
    let g:terminal_color_15 = s:terminal.white[0]
  endif
  " }}}
endif
" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
