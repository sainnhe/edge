" =============================================================================
" URL: https://github.com/sainnhe/edge
" Filename: autoload/edge.vim
" Author: sainnhe
" Email: sainnhe@gmail.com
" License: MIT License
" =============================================================================

function! edge#get_configuration() "{{{
  return {
        \ 'style': get(g:, 'edge_style', 'default'),
        \ 'transparent_background': get(g:, 'edge_transparent_background', 0),
        \ 'disable_italic_comment': get(g:, 'edge_disable_italic_comment', 0),
        \ 'enable_italic': get(g:, 'edge_enable_italic', 0),
        \ 'cursor': get(g:, 'edge_cursor', 'auto'),
        \ 'menu_selection_background': get(g:, 'edge_menu_selection_background', 'blue'),
        \ 'sign_column_background': get(g:, 'edge_sign_column_background', 'default'),
        \ 'current_word': get(g:, 'edge_current_word', get(g:, 'edge_transparent_background', 0) == 0 ? 'grey background' : 'bold'),
        \ 'lightline_disable_bold': get(g:, 'edge_lightline_disable_bold', 0),
        \ 'diagnostic_text_highlight': get(g:, 'edge_diagnostic_text_highlight', 0),
        \ 'diagnostic_line_highlight': get(g:, 'edge_diagnostic_line_highlight', 0),
        \ 'diagnostic_virtual_text': get(g:, 'edge_diagnostic_virtual_text', 'grey'),
        \ 'better_performance': get(g:, 'edge_better_performance', 0),
        \ }
endfunction "}}}
function! edge#get_palette(style) "{{{
  if &background ==# 'dark' "{{{
    if a:style ==# 'default' "{{{
      let palette = {
            \ 'bg0':        ['#2c2e34',   '235',  'Black'],
            \ 'bg1':        ['#30323a',   '236',  'DarkGrey'],
            \ 'bg2':        ['#363944',   '237',  'DarkGrey'],
            \ 'bg3':        ['#3b3e48',   '237',  'Grey'],
            \ 'bg4':        ['#414550',   '238',  'Grey'],
            \ 'bg_grey':    ['#828a98',   '246',  'LightGrey'],
            \ 'bg_red':     ['#ec7279',   '203',  'Red'],
            \ 'diff_red':   ['#55393d',   '52',   'DarkRed'],
            \ 'bg_green':   ['#a0c980',   '107',  'Green'],
            \ 'diff_green': ['#394634',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#6cb6eb',   '110',  'Blue'],
            \ 'diff_blue':  ['#354157',   '17',   'DarkBlue'],
            \ 'bg_purple':  ['#d38aea',   '176',  'Magenta'],
            \ 'diff_yellow':['#4e432f',   '54',   'DarkMagenta'],
            \ 'fg':         ['#c5cdd9',   '250',  'White'],
            \ 'red':        ['#ec7279',   '203',  'Red'],
            \ 'yellow':     ['#deb974',   '179',  'Yellow'],
            \ 'green':      ['#a0c980',   '107',  'Green'],
            \ 'cyan':       ['#5dbbc1',   '72',   'Cyan'],
            \ 'blue':       ['#6cb6eb',   '110',  'Blue'],
            \ 'purple':     ['#d38aea',   '176',  'Magenta'],
            \ 'grey':       ['#7f8490',   '246',  'LightGrey'],
            \ 'none':       ['NONE',      'NONE', 'NONE']
            \ } "}}}
    elseif a:style ==# 'aura' "{{{
      let palette = {
            \ 'bg0':        ['#2b2d37',   '235',  'Black'],
            \ 'bg1':        ['#2f323e',   '236',  'DarkGrey'],
            \ 'bg2':        ['#363a49',   '237',  'DarkGrey'],
            \ 'bg3':        ['#3a3e4e',   '237',  'Grey'],
            \ 'bg4':        ['#404455',   '238',  'Grey'],
            \ 'bg_grey':    ['#7e869b',   '246',  'LightGrey'],
            \ 'bg_red':     ['#ec7279',   '203',  'Red'],
            \ 'diff_red':   ['#55393d',   '52',   'DarkRed'],
            \ 'bg_green':   ['#a0c980',   '107',  'Green'],
            \ 'diff_green': ['#394634',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#6cb6eb',   '110',  'Blue'],
            \ 'diff_blue':  ['#354157',   '17',   'DarkBlue'],
            \ 'bg_purple':  ['#d38aea',   '176',  'Magenta'],
            \ 'diff_yellow':['#4e432f',   '54',   'DarkMagenta'],
            \ 'fg':         ['#c5cdd9',   '250',  'White'],
            \ 'red':        ['#ec7279',   '203',  'Red'],
            \ 'yellow':     ['#deb974',   '179',  'Yellow'],
            \ 'green':      ['#a0c980',   '107',  'Green'],
            \ 'cyan':       ['#5dbbc1',   '72',   'Cyan'],
            \ 'blue':       ['#6cb6eb',   '110',  'Blue'],
            \ 'purple':     ['#d38aea',   '176',  'Magenta'],
            \ 'grey':       ['#7e8294',   '246',  'LightGrey'],
            \ 'none':       ['NONE',      'NONE', 'NONE']
            \ } "}}}
    elseif a:style ==# 'neon' "{{{
      let palette = {
            \ 'bg0':        ['#2b2d3a',   '235',  'Black'],
            \ 'bg1':        ['#2f3242',   '236',  'DarkGrey'],
            \ 'bg2':        ['#363a4e',   '237',  'DarkGrey'],
            \ 'bg3':        ['#393e53',   '237',  'Grey'],
            \ 'bg4':        ['#3f445b',   '238',  'Grey'],
            \ 'bg_grey':    ['#7a819d',   '246',  'LightGrey'],
            \ 'bg_red':     ['#ec7279',   '203',  'Red'],
            \ 'diff_red':   ['#55393d',   '52',   'DarkRed'],
            \ 'bg_green':   ['#a0c980',   '107',  'Green'],
            \ 'diff_green': ['#394634',   '22',   'DarkGreen'],
            \ 'bg_blue':    ['#6cb6eb',   '110',  'Blue'],
            \ 'diff_blue':  ['#354157',   '17',   'DarkBlue'],
            \ 'bg_purple':  ['#d38aea',   '176',  'Magenta'],
            \ 'diff_yellow':['#4e432f',   '54',   'DarkMagenta'],
            \ 'fg':         ['#c5cdd9',   '250',  'White'],
            \ 'red':        ['#ec7279',   '203',  'Red'],
            \ 'yellow':     ['#deb974',   '179',  'Yellow'],
            \ 'green':      ['#a0c980',   '107',  'Green'],
            \ 'cyan':       ['#5dbbc1',   '72',   'Cyan'],
            \ 'blue':       ['#6cb6eb',   '110',  'Blue'],
            \ 'purple':     ['#d38aea',   '176',  'Magenta'],
            \ 'grey':       ['#7e8294',   '246',  'LightGrey'],
            \ 'none':       ['NONE',      'NONE', 'NONE']
            \ } "}}}
    endif "}}}
  else "{{{
    let palette = {
          \ 'bg0':        ['#fafafa',   '231',  'White'],
          \ 'bg1':        ['#eef1f4',   '255',  'LightGrey'],
          \ 'bg2':        ['#e8ebf0',   '254',  'LightGrey'],
          \ 'bg3':        ['#e8ebf0',   '253',  'Grey'],
          \ 'bg4':        ['#dde2e7',   '253',  'Grey'],
          \ 'bg_grey':    ['#bcc5cf',   '246',  'DarkGrey'],
          \ 'bg_red':     ['#e17373',   '167',  'Red'],
          \ 'diff_red':   ['#f6e4e4',   '217',  'LightRed'],
          \ 'bg_green':   ['#76af6f',   '107',  'Green'],
          \ 'diff_green': ['#e5eee4',   '150',  'LightGreen'],
          \ 'bg_blue':    ['#6996e0',   '68',   'Blue'],
          \ 'diff_blue':  ['#e3eaf6',   '153',  'LightBlue'],
          \ 'bg_purple':  ['#bf75d6',   '134',  'Magenta'],
          \ 'diff_yellow':['#f0ece2',   '183',  'LightMagenta'],
          \ 'fg':         ['#4b505b',   '240',  'Black'],
          \ 'red':        ['#d05858',   '167',  'Red'],
          \ 'yellow':     ['#be7e05',   '172',  'Yellow'],
          \ 'green':      ['#608e32',   '107',  'Green'],
          \ 'cyan':       ['#3a8b84',   '73',   'Cyan'],
          \ 'blue':       ['#5079be',   '68',   'Blue'],
          \ 'purple':     ['#b05ccc',   '134',  'Magenta'],
          \ 'grey':       ['#949ba5',   '245',  'Grey'],
          \ 'none':       ['NONE',      'NONE', 'NONE']
          \ }
  endif "}}}
  return palette
endfunction "}}}
function! edge#highlight(group, fg, bg, ...) "{{{
  execute 'highlight' a:group
        \ 'guifg=' . a:fg[0]
        \ 'guibg=' . a:bg[0]
        \ 'ctermfg=' . a:fg[1]
        \ 'ctermbg=' . a:bg[1]
        \ 'gui=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ (executable('tmux') && $TMUX !=# '' ?
              \ 'underline' :
              \ 'undercurl') :
            \ a:1) :
          \ 'NONE')
        \ 'cterm=' . (a:0 >= 1 ?
          \ (a:1 ==# 'undercurl' ?
            \ 'underline' :
            \ a:1) :
          \ 'NONE')
        \ 'guisp=' . (a:0 >= 2 ?
          \ a:2[0] :
          \ 'NONE')
endfunction "}}}
function! edge#ft_gen(path, last_modified, msg) "{{{
  " Generate the `after/ftplugin` directory.
  let full_content = join(readfile(a:path), "\n") " Get the content of `colors/edge.vim`
  let ft_content = []
  let rootpath = edge#ft_rootpath(a:path) " Get the path to place the `after/ftplugin` directory.
  call substitute(full_content, '" ft_begin.\{-}ft_end', '\=add(ft_content, submatch(0))', 'g') " Search for 'ft_begin.\{-}ft_end' (non-greedy) and put all the search results into a list.
  for content in ft_content
    let ft_list = []
    call substitute(matchstr(matchstr(content, 'ft_begin:.\{-}{{{'), ':.\{-}{{{'), '\(\w\|-\)\+', '\=add(ft_list, submatch(0))', 'g') " Get the file types. }}}}}}
    for ft in ft_list
      call edge#ft_write(rootpath, ft, content) " Write the content.
    endfor
  endfor
  call edge#ft_write(rootpath, 'text', "let g:edge_last_modified = '" . a:last_modified . "'") " Write the last modified time to `after/ftplugin/text/edge.vim`
  if a:msg ==# 'update'
    echohl WarningMsg | echom '[edge] Updated ' . rootpath . '/after/ftplugin' | echohl None
  else
    echohl WarningMsg | echom '[edge] Generated ' . rootpath . '/after/ftplugin' | echohl None
  endif
endfunction "}}}
function! edge#ft_write(rootpath, ft, content) "{{{
  " Write the content.
  let ft_path = a:rootpath . '/after/ftplugin/' . a:ft . '/edge.vim' " The path of a ftplugin file.
  " create a new file if it doesn't exist
  if !filereadable(ft_path)
    call mkdir(a:rootpath . '/after/ftplugin/' . a:ft, 'p')
    call writefile([
          \ "if !exists('g:colors_name') || g:colors_name !=# 'edge'",
          \ '    finish',
          \ 'endif'
          \ ], ft_path, 'a') " Abort if the current color scheme is not edge.
    call writefile([
          \ "if index(g:edge_loaded_file_types, '" . a:ft . "') ==# -1",
          \ "    call add(g:edge_loaded_file_types, '" . a:ft . "')",
          \ 'else',
          \ '    finish',
          \ 'endif'
          \ ], ft_path, 'a') " Abort if this file type has already been loaded.
  endif
  " If there is something like `call edge#highlight()`, then add
  " code to initialize the palette and configuration.
  if matchstr(a:content, 'edge#highlight') !=# ''
    call writefile([
          \ 'let s:configuration = edge#get_configuration()',
          \ 'let s:palette = edge#get_palette(s:configuration.style)'
          \ ], ft_path, 'a')
  endif
  " Append the content.
  call writefile(split(a:content, "\n"), ft_path, 'a')
endfunction "}}}
function! edge#ft_rootpath(path) "{{{
  " Get the directory where `after/ftplugin` is generated.
  if (matchstr(a:path, '^/usr/share') ==# '') || has('win32') " Return the plugin directory. The `after/ftplugin` directory should never be generated in `/usr/share`, even if you are a root user.
    return fnamemodify(a:path, ':p:h:h')
  else " Use vim home directory.
    if has('nvim')
      return stdpath('config')
    else
      if has('win32') || has ('win64')
        return $VIM . '/vimfiles'
      else
        return $HOME . '/.vim'
      endif
    endif
  endif
endfunction "}}}
function! edge#ft_newest(path, last_modified) "{{{
  " Determine whether the current ftplugin files are up to date by comparing the last modified time in `colors/edge.vim` and `after/ftplugin/text/edge.vim`.
  let rootpath = edge#ft_rootpath(a:path)
  execute 'source ' . rootpath . '/after/ftplugin/text/edge.vim'
  return a:last_modified ==# g:edge_last_modified ? 1 : 0
endfunction "}}}
function! edge#ft_clean(path, msg) "{{{
  " Clean the `after/ftplugin` directory.
  let rootpath = edge#ft_rootpath(a:path)
  " Remove `after/ftplugin/**/edge.vim`.
  let file_list = split(globpath(rootpath, 'after/ftplugin/**/edge.vim'), "\n")
  for file in file_list
    call delete(file)
  endfor
  " Remove empty directories.
  let dir_list = split(globpath(rootpath, 'after/ftplugin/*'), "\n")
  for dir in dir_list
    if globpath(dir, '*') ==# ''
      call delete(dir, 'd')
    endif
  endfor
  if globpath(rootpath . '/after/ftplugin', '*') ==# ''
    call delete(rootpath . '/after/ftplugin', 'd')
  endif
  if globpath(rootpath . '/after', '*') ==# ''
    call delete(rootpath . '/after', 'd')
  endif
  if a:msg
    echohl WarningMsg | echom '[edge] Cleaned ' . rootpath . '/after/ftplugin' | echohl None
  endif
endfunction "}}}
function! edge#ft_exists(path) "{{{
  return filereadable(edge#ft_rootpath(a:path) . '/after/ftplugin/text/edge.vim')
endfunction "}}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker fmr={{{,}}}:
