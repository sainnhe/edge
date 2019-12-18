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
          \ 'bg4':        ['#dde2e7',   '253',  'Grey'],
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
          \ 'bg4':        ['#dde4ea',   '253',  'Grey'],
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

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
