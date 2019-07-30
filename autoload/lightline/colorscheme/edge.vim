" =============================================================================
" URL: https://github.com/sainnhe/edge/
" Filename: autoload/lightline/colorscheme/edge.vim
" Author: Sainnhepark
" Email: sainnhe@gmail.com
" License: MIT License & Anti-996 License
" =============================================================================

"{{{Palette
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

if &background ==# 'dark'
    let s:foreground = [ '#b7bec9', 0 ]
    let s:background = [ '#262729', 0 ]
    let s:background_alt = [ '#2d2f33', 0 ]
    let s:background_grey = [ '#3e4249', 0 ]
    let s:red = [ '#e77171', 0 ]
    let s:purple = [ '#d390e7', 0 ]
    let s:yellow = [ '#ddb66c', 0 ]
    let s:green = [ '#a1bf78', 0 ]
    let s:blue = [ '#73b3e7', 0 ]
    let s:grey = [ '#88909f', 0 ]
else
    let s:foreground = [ '#656c78', 0 ]
    let s:background = [ '#fafafa', 0 ]
    let s:background_alt = [ '#eceff2', 0 ]
    let s:background_grey = [ '#dde2e7', 0 ]
    let s:red = [ '#db7070', 0 ]
    let s:purple = [ '#b870ce', 0 ]
    let s:yellow = [ '#d69822', 0 ]
    let s:green = [ '#83b474', 0 ]
    let s:blue = [ '#6587bf', 0 ]
    let s:grey = [ '#949ba5', 0 ]
endif
"}}}

"{{{Definition
let s:tab_l_fg = s:foreground
let s:tab_l_bg = s:background_grey
let s:tab_r_fg = s:red
let s:tab_r_bg = s:background_grey
let s:tab_sel_fg = s:background
let s:tab_sel_bg = s:purple
let s:tab_middle_fg = s:grey
let s:tab_middle_bg = s:background_alt

let s:warningfg = s:background
let s:warningbg = s:yellow
let s:errorfg = s:background
let s:errorbg = s:red

let s:normal_l1_fg = s:background
let s:normal_l1_bg = s:green
let s:normal_l2_fg = s:foreground
let s:normal_l2_bg = s:background_grey
let s:normal_r1_fg = s:background
let s:normal_r1_bg = s:green
let s:normal_r2_fg = s:foreground
let s:normal_r2_bg = s:background_grey
let s:normal_middle_fg = s:grey
let s:normal_middle_bg = s:background_alt

let s:insert_l1_fg = s:background
let s:insert_l1_bg = s:blue
let s:insert_l2_fg = s:foreground
let s:insert_l2_bg = s:background_grey
let s:insert_r1_fg = s:background
let s:insert_r1_bg = s:blue
let s:insert_r2_fg = s:foreground
let s:insert_r2_bg = s:background_grey
let s:insert_middle_fg = s:grey
let s:insert_middle_bg = s:background_alt

let s:visual_l1_fg = s:background
let s:visual_l1_bg = s:red
let s:visual_l2_fg = s:foreground
let s:visual_l2_bg = s:background_grey
let s:visual_r1_fg = s:background
let s:visual_r1_bg = s:red
let s:visual_r2_fg = s:foreground
let s:visual_r2_bg = s:background_grey
let s:visual_middle_fg = s:grey
let s:visual_middle_bg = s:background_alt

let s:replace_l1_fg = s:background
let s:replace_l1_bg = s:yellow
let s:replace_l2_fg = s:foreground
let s:replace_l2_bg = s:background_grey
let s:replace_r1_fg = s:background
let s:replace_r1_bg = s:yellow
let s:replace_r2_fg = s:foreground
let s:replace_r2_bg = s:background_grey
let s:replace_middle_fg = s:grey
let s:replace_middle_bg = s:background_alt

let s:inactive_l1_fg = s:foreground
let s:inactive_l1_bg = s:background_grey
let s:inactive_l2_fg = s:foreground
let s:inactive_l2_bg = s:background_grey
let s:inactive_r1_fg = s:foreground
let s:inactive_r1_bg = s:background_grey
let s:inactive_r2_fg = s:foreground
let s:inactive_r2_bg = s:background_grey
let s:inactive_middle_fg = s:grey
let s:inactive_middle_bg = s:background_alt

"}}}

"{{{Implementation
let s:p.normal.left = [ [ s:normal_l1_fg, s:normal_l1_bg ], [ s:normal_l2_fg, s:normal_l2_bg ] ]
let s:p.normal.middle = [ [ s:normal_middle_fg, s:normal_middle_bg ] ]
let s:p.normal.right = [ [ s:normal_r1_fg, s:normal_r1_bg ], [ s:normal_r2_fg, s:normal_r2_bg ] ]

let s:p.insert.left = [ [ s:insert_l1_fg, s:insert_l1_bg ], [ s:insert_l2_fg, s:insert_l2_bg ] ]
let s:p.insert.middle = [ [ s:insert_middle_fg, s:insert_middle_bg ] ]
let s:p.insert.right = [ [ s:insert_r1_fg, s:insert_r1_bg ], [ s:insert_r2_fg, s:insert_r2_bg ] ]

let s:p.visual.left = [ [ s:visual_l1_fg, s:visual_l1_bg ], [ s:visual_l2_fg, s:visual_l2_bg ] ]
let s:p.visual.middle = [ [ s:visual_middle_fg, s:visual_middle_bg ] ]
let s:p.visual.right = [ [ s:visual_r1_fg, s:visual_r1_bg ], [ s:visual_r2_fg, s:visual_r2_bg ] ]

let s:p.replace.left = [ [ s:replace_l1_fg, s:replace_l1_bg ], [ s:replace_l2_fg, s:replace_l2_bg ] ]
let s:p.replace.middle = [ [ s:replace_middle_fg, s:replace_middle_bg ] ]
let s:p.replace.right = [ [ s:replace_r1_fg, s:replace_r1_bg ], [ s:replace_r2_fg, s:replace_r2_bg ] ]

let s:p.inactive.left = [ [ s:inactive_l1_fg, s:inactive_l1_bg ], [ s:inactive_l2_fg, s:inactive_l2_bg ] ]
let s:p.inactive.middle = [ [ s:inactive_middle_fg, s:inactive_middle_bg ] ]
let s:p.inactive.right = [ [ s:inactive_r1_fg, s:inactive_r1_bg ], [ s:inactive_r2_fg, s:inactive_r2_bg ] ]

let s:p.tabline.left = [ [ s:tab_l_fg, s:tab_l_bg] ]
let s:p.tabline.right = [ [ s:tab_r_fg, s:tab_r_bg] ]
let s:p.tabline.tabsel = [ [ s:tab_sel_fg, s:tab_sel_bg ] ]
let s:p.tabline.middle = [ [ s:tab_middle_fg, s:tab_middle_bg] ]

let s:p.normal.error = [ [ s:errorfg, s:errorbg ] ]
let s:p.normal.warning = [ [ s:warningfg, s:warningbg ] ]


if (has('termguicolors') && &termguicolors) || has('gui_running')
    let s:p.normal.left = [ [ s:normal_l1_fg, s:normal_l1_bg, 'bold' ], [ s:normal_l2_fg, s:normal_l2_bg ] ]
    let s:p.normal.right = [ [ s:normal_r1_fg, s:normal_r1_bg, 'bold' ], [ s:normal_r2_fg, s:normal_r2_bg ] ]
    let s:p.insert.left = [ [ s:insert_l1_fg, s:insert_l1_bg, 'bold' ], [ s:insert_l2_fg, s:insert_l2_bg ] ]
    let s:p.insert.right = [ [ s:insert_r1_fg, s:insert_r1_bg, 'bold' ], [ s:insert_r2_fg, s:insert_r2_bg ] ]
    let s:p.visual.left = [ [ s:visual_l1_fg, s:visual_l1_bg, 'bold' ], [ s:visual_l2_fg, s:visual_l2_bg ] ]
    let s:p.visual.right = [ [ s:visual_r1_fg, s:visual_r1_bg, 'bold' ], [ s:visual_r2_fg, s:visual_r2_bg ] ]
    let s:p.replace.left = [ [ s:replace_l1_fg, s:replace_l1_bg, 'bold' ], [ s:replace_l2_fg, s:replace_l2_bg ] ]
    let s:p.replace.right = [ [ s:replace_r1_fg, s:replace_r1_bg, 'bold' ], [ s:replace_r2_fg, s:replace_r2_bg ] ]
    let s:p.tabline.tabsel = [ [ s:tab_sel_fg, s:tab_sel_bg, 'bold' ] ]
endif
"}}}

let g:lightline#colorscheme#edge#palette = lightline#colorscheme#flatten(s:p)
